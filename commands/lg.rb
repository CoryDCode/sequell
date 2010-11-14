# Autogenerated from a Treetop grammar. Edits may be lost.


module ListgameQuery
  include Treetop::Runtime

  def root
    @root ||= :query
  end

  module Query0
    def query_body
      elements[1]
    end
  end

  def _nt_query
    start_index = index
    if node_cache[:query].has_key?(index)
      cached = node_cache[:query][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_query_mode
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_query_body
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Query0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query][start_index] = r0

    r0
  end

  module QueryMode0
  end

  def _nt_query_mode
    start_index = index
    if node_cache[:query_mode].has_key?(index)
      cached = node_cache[:query_mode][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    if has_terminal?("!lm", false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure("!lm")
      r2 = nil
    end
    if r2
      r1 = r2
    else
      if has_terminal?("!lg", false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure("!lg")
        r3 = nil
      end
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      r5 = _nt_whitespace
      if r5
        r4 = r5
      else
        r4 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r4
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(QueryMode0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query_mode][start_index] = r0

    r0
  end

  def _nt_whitespace
    start_index = index
    if node_cache[:whitespace].has_key?(index)
      cached = node_cache[:whitespace][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\s]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:whitespace][start_index] = r0

    r0
  end

  module QueryBody0
  end

  def _nt_query_body
    start_index = index
    if node_cache[:query_body].has_key?(index)
      cached = node_cache[:query_body][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_nick_selector
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        r4 = _nt_query_keyword
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s0 << r3
      if r3
        s5, i5 = [], index
        loop do
          r6 = _nt_query_part
          if r6
            s5 << r6
          else
            break
          end
        end
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(QueryBody0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query_body][start_index] = r0

    r0
  end

  module NickSelector0
    def nick
      elements[2]
    end

  end

  def _nt_nick_selector
    start_index = index
    if node_cache[:nick_selector].has_key?(index)
      cached = node_cache[:nick_selector][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_negation
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r4 = _nt_nickref_symbol
      if r4
        r3 = r4
      else
        r3 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r3
      if r3
        r5 = _nt_nick
        s0 << r5
        if r5
          r7 = _nt_whitespace
          if r7
            r6 = r7
          else
            r6 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r6
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(NickSelector0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:nick_selector][start_index] = r0

    r0
  end

  module QueryKeyword0
    def query_keyword_body
      elements[1]
    end

  end

  def _nt_query_keyword
    start_index = index
    if node_cache[:query_keyword].has_key?(index)
      cached = node_cache[:query_keyword][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_negation
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_query_keyword_body
      s0 << r3
      if r3
        r5 = _nt_whitespace
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(QueryKeyword0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query_keyword][start_index] = r0

    r0
  end

  module QueryKeywordBody0
  end

  module QueryKeywordBody1
  end

  def _nt_query_keyword_body
    start_index = index
    if node_cache[:query_keyword_body].has_key?(index)
      cached = node_cache[:query_keyword_body][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[a-zA-Z0-9]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[a-zA-Z0-9.]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        i4 = index
        i5, s5 = index, []
        i6 = index
        if has_terminal?(" ", false, index)
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(" ")
          r7 = nil
        end
        if r7
          r6 = nil
        else
          @index = i6
          r6 = instantiate_node(SyntaxNode,input, index...index)
        end
        s5 << r6
        if r6
          if index < input_length
            r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("any character")
            r8 = nil
          end
          s5 << r8
        end
        if s5.last
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          r5.extend(QueryKeywordBody0)
        else
          @index = i5
          r5 = nil
        end
        if r5
          r4 = nil
        else
          @index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(QueryKeywordBody1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query_keyword_body][start_index] = r0

    r0
  end

  def _nt_negation
    start_index = index
    if node_cache[:negation].has_key?(index)
      cached = node_cache[:negation][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?("!", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("!")
      r0 = nil
    end

    node_cache[:negation][start_index] = r0

    r0
  end

  def _nt_nickref_symbol
    start_index = index
    if node_cache[:nickref_symbol].has_key?(index)
      cached = node_cache[:nickref_symbol][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?("@", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("@")
      r0 = nil
    end

    node_cache[:nickref_symbol][start_index] = r0

    r0
  end

  module Nick0
  end

  module Nick1
  end

  def _nt_nick
    start_index = index
    if node_cache[:nick].has_key?(index)
      cached = node_cache[:nick][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    s2, i2 = [], index
    loop do
      if has_terminal?('\G[a-zA-Z0-9_+`\'-]', true, index)
        r3 = true
        @index += 1
      else
        r3 = nil
      end
      if r3
        s2 << r3
      else
        break
      end
    end
    if s2.empty?
      @index = i2
      r2 = nil
    else
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
    end
    if r2
      r1 = r2
    else
      if has_terminal?(".", false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(".")
        r4 = nil
      end
      if r4
        r1 = r4
      else
        if has_terminal?("*", false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("*")
          r5 = nil
        end
        if r5
          r1 = r5
        else
          @index = i1
          r1 = nil
        end
      end
    end
    s0 << r1
    if r1
      i6 = index
      i7, s7 = index, []
      i8 = index
      if has_terminal?(" ", false, index)
        r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(" ")
        r9 = nil
      end
      if r9
        r8 = nil
      else
        @index = i8
        r8 = instantiate_node(SyntaxNode,input, index...index)
      end
      s7 << r8
      if r8
        if index < input_length
          r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("any character")
          r10 = nil
        end
        s7 << r10
      end
      if s7.last
        r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
        r7.extend(Nick0)
      else
        @index = i7
        r7 = nil
      end
      if r7
        r6 = nil
      else
        @index = i6
        r6 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r6
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Nick1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:nick][start_index] = r0

    r0
  end

  module QueryPart0
  end

  def _nt_query_part
    start_index = index
    if node_cache[:query_part].has_key?(index)
      cached = node_cache[:query_part][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_field_grouping
    if r2
      r1 = r2
    else
      r3 = _nt_field_extract
      if r3
        r1 = r3
      else
        r4 = _nt_ordering
        if r4
          r1 = r4
        else
          r5 = _nt_key_op_val_arg
          if r5
            r1 = r5
          else
            r6 = _nt_result_index
            if r6
              r1 = r6
            else
              @index = i1
              r1 = nil
            end
          end
        end
      end
    end
    s0 << r1
    if r1
      r8 = _nt_whitespace
      if r8
        r7 = r8
      else
        r7 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r7
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(QueryPart0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query_part][start_index] = r0

    r0
  end

  def _nt_result_index
    start_index = index
    if node_cache[:result_index].has_key?(index)
      cached = node_cache[:result_index][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_integer

    node_cache[:result_index][start_index] = r0

    r0
  end

  module Integer0
  end

  def _nt_integer
    start_index = index
    if node_cache[:integer].has_key?(index)
      cached = node_cache[:integer][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[+-]', true, index)
      r2 = true
      @index += 1
    else
      r2 = nil
    end
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r4 = true
          @index += 1
        else
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        @index = i3
        r3 = nil
      else
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      end
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Integer0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:integer][start_index] = r0

    r0
  end

  module Ordering0
    def ordered_field
      elements[1]
    end
  end

  module Ordering1
    def ordered_field
      elements[1]
    end

  end

  module Ordering2
    def query_field
      elements[1]
    end
  end

  module Ordering3
    def query_field
      elements[1]
    end
  end

  def _nt_ordering
    start_index = index
    if node_cache[:ordering].has_key?(index)
      cached = node_cache[:ordering][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if has_terminal?("o=", false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure("o=")
      r2 = nil
    end
    s1 << r2
    if r2
      r3 = _nt_ordered_field
      s1 << r3
      if r3
        s4, i4 = [], index
        loop do
          i5, s5 = index, []
          if has_terminal?(",", false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(",")
            r6 = nil
          end
          s5 << r6
          if r6
            r7 = _nt_ordered_field
            s5 << r7
          end
          if s5.last
            r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
            r5.extend(Ordering0)
          else
            @index = i5
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Ordering1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i8, s8 = index, []
      if has_terminal?("max=", false, index)
        r9 = instantiate_node(SyntaxNode,input, index...(index + 4))
        @index += 4
      else
        terminal_parse_failure("max=")
        r9 = nil
      end
      s8 << r9
      if r9
        r10 = _nt_query_field
        s8 << r10
      end
      if s8.last
        r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
        r8.extend(Ordering2)
      else
        @index = i8
        r8 = nil
      end
      if r8
        r0 = r8
      else
        i11, s11 = index, []
        if has_terminal?("min=", false, index)
          r12 = instantiate_node(SyntaxNode,input, index...(index + 4))
          @index += 4
        else
          terminal_parse_failure("min=")
          r12 = nil
        end
        s11 << r12
        if r12
          r13 = _nt_query_field
          s11 << r13
        end
        if s11.last
          r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
          r11.extend(Ordering3)
        else
          @index = i11
          r11 = nil
        end
        if r11
          r0 = r11
        else
          @index = i0
          r0 = nil
        end
      end
    end

    node_cache[:ordering][start_index] = r0

    r0
  end

  module OrderedField0
    def query_field
      elements[1]
    end
  end

  def _nt_ordered_field
    start_index = index
    if node_cache[:ordered_field].has_key?(index)
      cached = node_cache[:ordered_field][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[+-]', true, index)
      r2 = true
      @index += 1
    else
      r2 = nil
    end
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_query_field
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(OrderedField0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:ordered_field][start_index] = r0

    r0
  end

  module FieldGrouping0
    def query_field
      elements[1]
    end
  end

  module FieldGrouping1
    def query_field
      elements[1]
    end

  end

  def _nt_field_grouping
    start_index = index
    if node_cache[:field_grouping].has_key?(index)
      cached = node_cache[:field_grouping][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("s=", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure("s=")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_query_field
      s0 << r2
      if r2
        s3, i3 = [], index
        loop do
          i4, s4 = index, []
          if has_terminal?(",", false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(",")
            r5 = nil
          end
          s4 << r5
          if r5
            r6 = _nt_query_field
            s4 << r6
          end
          if s4.last
            r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
            r4.extend(FieldGrouping0)
          else
            @index = i4
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(FieldGrouping1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:field_grouping][start_index] = r0

    r0
  end

  module FieldExtract0
    def query_field
      elements[1]
    end
  end

  module FieldExtract1
    def query_field
      elements[1]
    end

  end

  def _nt_field_extract
    start_index = index
    if node_cache[:field_extract].has_key?(index)
      cached = node_cache[:field_extract][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("x=", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure("x=")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_query_field
      s0 << r2
      if r2
        s3, i3 = [], index
        loop do
          i4, s4 = index, []
          if has_terminal?(",", false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(",")
            r5 = nil
          end
          s4 << r5
          if r5
            r6 = _nt_query_field
            s4 << r6
          end
          if s4.last
            r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
            r4.extend(FieldExtract0)
          else
            @index = i4
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(FieldExtract1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:field_extract][start_index] = r0

    r0
  end

  module Ordering0
    def ordered_field
      elements[1]
    end
  end

  module Ordering1
    def ordered_field
      elements[1]
    end

  end

  def _nt_ordering
    start_index = index
    if node_cache[:ordering].has_key?(index)
      cached = node_cache[:ordering][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("o=", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure("o=")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_ordered_field
      s0 << r2
      if r2
        s3, i3 = [], index
        loop do
          i4, s4 = index, []
          if has_terminal?(",", false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(",")
            r5 = nil
          end
          s4 << r5
          if r5
            r6 = _nt_ordered_field
            s4 << r6
          end
          if s4.last
            r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
            r4.extend(Ordering0)
          else
            @index = i4
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Ordering1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:ordering][start_index] = r0

    r0
  end

  module KeyOpValArg0
    def whitespace
      elements[0]
    end

    def key_op_val_arg
      elements[1]
    end
  end

  module KeyOpValArg1
    def query_field
      elements[0]
    end

    def query_operator
      elements[2]
    end

  end

  module KeyOpValArg2
    def query_field
      elements[0]
    end

    def query_operator
      elements[2]
    end

    def query_value
      elements[4]
    end
  end

  def _nt_key_op_val_arg
    start_index = index
    if node_cache[:key_op_val_arg].has_key?(index)
      cached = node_cache[:key_op_val_arg][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_query_field
    s1 << r2
    if r2
      r4 = _nt_whitespace
      if r4
        r3 = r4
      else
        r3 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r3
      if r3
        r5 = _nt_query_operator
        s1 << r5
        if r5
          i6 = index
          i7, s7 = index, []
          r8 = _nt_whitespace
          s7 << r8
          if r8
            r9 = _nt_key_op_val_arg
            s7 << r9
          end
          if s7.last
            r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
            r7.extend(KeyOpValArg0)
          else
            @index = i7
            r7 = nil
          end
          if r7
            @index = i6
            r6 = instantiate_node(SyntaxNode,input, index...index)
          else
            r6 = nil
          end
          s1 << r6
        end
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(KeyOpValArg1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i10, s10 = index, []
      r11 = _nt_query_field
      s10 << r11
      if r11
        r13 = _nt_whitespace
        if r13
          r12 = r13
        else
          r12 = instantiate_node(SyntaxNode,input, index...index)
        end
        s10 << r12
        if r12
          r14 = _nt_query_operator
          s10 << r14
          if r14
            r16 = _nt_whitespace
            if r16
              r15 = r16
            else
              r15 = instantiate_node(SyntaxNode,input, index...index)
            end
            s10 << r15
            if r15
              r17 = _nt_query_value
              s10 << r17
            end
          end
        end
      end
      if s10.last
        r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
        r10.extend(KeyOpValArg2)
      else
        @index = i10
        r10 = nil
      end
      if r10
        r0 = r10
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:key_op_val_arg][start_index] = r0

    r0
  end

  module QueryField0
    def word_part
      elements[1]
    end
  end

  module QueryField1
    def word_part
      elements[0]
    end

  end

  def _nt_query_field
    start_index = index
    if node_cache[:query_field].has_key?(index)
      cached = node_cache[:query_field][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_word_part
    s0 << r1
    if r1
      i3, s3 = index, []
      if has_terminal?(":", false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(":")
        r4 = nil
      end
      s3 << r4
      if r4
        r5 = _nt_word_part
        s3 << r5
      end
      if s3.last
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        r3.extend(QueryField0)
      else
        @index = i3
        r3 = nil
      end
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(QueryField1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query_field][start_index] = r0

    r0
  end

  module QueryValue0
  end

  def _nt_query_value
    start_index = index
    if node_cache[:query_value].has_key?(index)
      cached = node_cache[:query_value][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1 = index
      i2, s2 = index, []
      if has_terminal?(" ", false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(" ")
        r3 = nil
      end
      s2 << r3
      if r3
        i4 = index
        r5 = _nt_key_op_val_arg
        if r5
          r4 = nil
        else
          @index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s2 << r4
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(QueryValue0)
      else
        @index = i2
        r2 = nil
      end
      if r2
        r1 = r2
      else
        if has_terminal?('\G[^\\s]', true, index)
          r6 = true
          @index += 1
        else
          r6 = nil
        end
        if r6
          r1 = r6
        else
          @index = i1
          r1 = nil
        end
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:query_value][start_index] = r0

    r0
  end

  def _nt_word_part
    start_index = index
    if node_cache[:word_part].has_key?(index)
      cached = node_cache[:word_part][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[a-zA-Z.0-9_]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:word_part][start_index] = r0

    r0
  end

  def _nt_query_operator
    start_index = index
    if node_cache[:query_operator].has_key?(index)
      cached = node_cache[:query_operator][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?("<=", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure("<=")
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?("<", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("<")
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?(">=", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure(">=")
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if has_terminal?(">", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(">")
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if has_terminal?("==", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure("==")
              r5 = nil
            end
            if r5
              r0 = r5
            else
              if has_terminal?("=", false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure("=")
                r6 = nil
              end
              if r6
                r0 = r6
              else
                if has_terminal?("!==", false, index)
                  r7 = instantiate_node(SyntaxNode,input, index...(index + 3))
                  @index += 3
                else
                  terminal_parse_failure("!==")
                  r7 = nil
                end
                if r7
                  r0 = r7
                else
                  if has_terminal?("!=", false, index)
                    r8 = instantiate_node(SyntaxNode,input, index...(index + 2))
                    @index += 2
                  else
                    terminal_parse_failure("!=")
                    r8 = nil
                  end
                  if r8
                    r0 = r8
                  else
                    if has_terminal?("=~", false, index)
                      r9 = instantiate_node(SyntaxNode,input, index...(index + 2))
                      @index += 2
                    else
                      terminal_parse_failure("=~")
                      r9 = nil
                    end
                    if r9
                      r0 = r9
                    else
                      if has_terminal?("~~", false, index)
                        r10 = instantiate_node(SyntaxNode,input, index...(index + 2))
                        @index += 2
                      else
                        terminal_parse_failure("~~")
                        r10 = nil
                      end
                      if r10
                        r0 = r10
                      else
                        if has_terminal?("!~", false, index)
                          r11 = instantiate_node(SyntaxNode,input, index...(index + 2))
                          @index += 2
                        else
                          terminal_parse_failure("!~")
                          r11 = nil
                        end
                        if r11
                          r0 = r11
                        else
                          if has_terminal?("!~~", false, index)
                            r12 = instantiate_node(SyntaxNode,input, index...(index + 3))
                            @index += 3
                          else
                            terminal_parse_failure("!~~")
                            r12 = nil
                          end
                          if r12
                            r0 = r12
                          else
                            @index = i0
                            r0 = nil
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:query_operator][start_index] = r0

    r0
  end

end

class ListgameQueryParser < Treetop::Runtime::CompiledParser
  include ListgameQuery
end
