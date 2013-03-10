module Sql
  class Operator
    def self.op(op_str)
      return op_str if !op_str || op_str.is_a?(self)
      self.new(op_str)
    end

    def self.operator(o)
      self.op(o)
    end

    attr_reader :op

    def initialize(logical_op)
      @op = logical_op
    end

    def sql_operator
      OPERATORS[@op] || @op
    end

    def textual?
      ['=~','!~','~~', '!~~'].index(@op)
    end

    def equality?
      [ '=', '!=' ].index(@op)
    end

    def relational?
      ['<', '<=', '>', '>='].index(@op)
    end

    def negate
      self.class.new(OPERATOR_NEGATION[@op])
    end

    def equal?
      @op == '='
    end

    def not_equal?
      @op == '!='
    end

    def === (ops)
      if ops.is_a?(Enumerable)
        ops.any? { |op| op == @op }
      else
        @op == ops
      end
    end

    def == (other)
      @op == Sql::Operator.op(other).op
    end

    def to_sql
      self.sql_operator
    end

    def to_s
      @op
    end
  end
end
