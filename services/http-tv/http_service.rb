$:.push(File.join(ENV['HENZELL_ROOT'], 'src'))

SERVICE_PORT = 29880

require 'bundler/setup'
require 'sinatra'

set :port, SERVICE_PORT

get '/tv/channels' do
  require 'tv/channel_manager'

  content_type '.txt'
  TV::ChannelManager.list_channels
end

get '/search' do
  query = params[:query]
  unless query
    status 400
    body "Bad request"
    return
  end

  require 'cmd/executor'
  require 'libtv'
  require 'services/request_throttle'

  Services::RequestThrottle.throttle(1, self) {
    TV.as_channel_server {
      Cmd::Executor.execute(query, :permitted_commands => ['!lg', '!lm', '??'])
    }
  }
end
