#! /usr/bin/env ruby

require 'gserver'
require 'helper'
require 'sqlop/tv_view_count'
require 'fileutils'
require 'termcast_config'
require 'thread'

module TV
  @@tv_args = nil
  @channel_server = !!ENV['TV_CHANNEL_SERVER']

  TV_QUEUE_DIR = 'tmp/tv'
  TV_QUEUE_FILE = 'tv.queue'
  TV_LOCK_FILE = 'tv.queue.lock'
  TV_LOG_FILE = 'tv.queue.log'

  def self.queue_dir
    TV_QUEUE_DIR
  end

  def self.queue_dir_file(file)
    FileUtils.mkdir_p(self.queue_dir)
    File.join(self.queue_dir, file)
  end

  def self.queue_file
    queue_dir_file(TV_QUEUE_FILE)
  end

  def self.lock_file
    queue_dir_file(TV_LOCK_FILE)
  end

  def self.log_file
    queue_dir_file(TV_LOG_FILE)
  end

  def self.channel_server?
    @channel_server
  end

  def self.as_channel_server
    old_channel_server = @channel_server
    old_env = ENV['TV_CHANNEL_SERVER']
    begin
      @channel_server = true
      ENV['TV_CHANNEL_SERVER'] = 'y'
      yield
    ensure
      @channel_server = old_channel_server
      ENV['TV_CHANNEL_SERVER'] = old_env
    end
  end

  class SyncQueue < Array
    attr_reader :mutex, :c
    def initialize(*args)
      super
      @mutex = Mutex.new
      @c = ConditionVariable.new
    end

    def wait
      c.wait(mutex)
    end

    def signal
      c.signal
    end

    def synchronize(&block)
      mutex.synchronize(&block)
    end
  end

  # Serves TV requests to FooTV instances.
  class TVServ < GServer
    def initialize(port = 21976, host = "0.0.0.0")
      puts "Starting TV notification server."
      @started = Time.now.strftime("%s").to_i
      @clients = []
      @mutex = Mutex.new
      @monitor = nil
      super(port, host, Float::MAX, $stderr, true)
    end

    def bootstrap_client
      client_request_queue = SyncQueue.new

      @mutex.synchronize do
        @clients << client_request_queue
        unless @monitor
          @monitor = Thread.new { run_monitor }
        end
      end
      client_request_queue
    end

    def run_monitor
      begin
        while true
          open(TV.queue_file, 'r+') do |af|
            TV.flock(af, File::LOCK_EX) do |f|
              lines = f.readlines
              f.truncate(0)

              new_lines = lines.find_all do |line|
                if line =~ /^(\d+) .*/
                  start = $1.to_i
                  start >= @started
                end
              end

              clients = @mutex.synchronize { @clients }
              clients.each do |c|
                c.synchronize do
                  c.push(*new_lines)
                  c.signal
                end
              end
            end
          end
          sleep 3
        end
      rescue
        puts "Monitor: #$!"
      end
    end

    def serve(sock)
      client_queue = nil
      begin
        client_queue = bootstrap_client()
        while true
          client_queue.synchronize do
            client_queue.wait
            client_queue.each do |q|
              sock.write(q)
              sock.flush
            end
            client_queue.clear
          end
        end
      rescue
        puts "Ack: #$!"
      ensure
        if client_queue
          @mutex.synchronize do
            @clients.delete_if { |q| q.equal?(client_queue) }
          end
        end
      end
    end
  end

  def self.flock(file, mode)
    success = file.flock(mode)
    if success
      begin
        res = yield file
        return res
      ensure
        file.flock(File::LOCK_UN)
      end
    end
    nil
  end

  def self.oflock(filename, mode)
    open(filename, 'w') do |of|
      flock(of, mode) do |f|
        return yield(f)
      end
    end
    nil
  end

  def self.launch_daemon()
    return if fork()

    begin
      Process.setsid
    ensure
    end

    # Try for a lock, but do not block
    oflock(TV.lock_file, File::LOCK_EX | File::LOCK_NB) do |f|

      # Be a good citizen:
      logfile = File.open(TV.log_file, 'w')
      logfile.sync = true
      STDOUT.reopen(logfile)
      STDERR.reopen(logfile)
      STDIN.close()

      # Start the notification server and wait on it.
      tv = TVServ.new
      tv.start()
      tv.join()
    end
    exit 0
  end

  def self.request_game(g)
    # Launch a daemon that keeps a server socket open for interested
    # parties (i.e. C-SPLAT) to listen in.
    launch_daemon()

    open(TV.queue_file, 'a') do |file|
      flock(file, File::LOCK_EX) do |f|
        # Make sure we're really at eof.
        f.seek(0, IO::SEEK_END)
        stripped = g
        f.puts "#{Time.now.strftime('%s')} #{munge_game(stripped)}"
      end
    end
  end

  def self.tv_description(tv)
    "#{tv}: #{TermcastConfig.client_urls.join(' or ')}"
  end

  def self.request_game_verbosely(n, g, who, tv_opt)
    puts(self.request_game_msg(n, g, who, tv_opt))
  end

  def self.request_game_msg(n, g, who, tv_opt)
    msg = nil
    summary = short_game_summary(g)
    if tv_opt && tv_opt[:channel]
      tv_opt[:channel] = tv_opt.channel_name(g)
    end
    tv = (tv_opt && tv_opt[:channel]) || 'FooTV'

    unless TV.channel_server?
      if tv_opt && tv_opt[:nuke]
        msg = "#{tv} playlist clear requested by #{who}."
      else
        suffix = tv_opt && tv_opt[:cancel] ? ' cancel' : ''
        msg = "#{n}. #{summary}#{suffix} requested for #{tv_description(tv)}."
      end

      Sqlop::TVViewCount.increment(g)
      g['req'] = ARGV[1]
    end

    g = g.merge(tv_opt.opts) if tv_opt
    if TV.channel_server?
      return "#{n}. :#{munge_game(g)}:"
    else
      request_game(g)
      msg
    end
  end
end
