require 'sql/query_table'
require 'set'

module Sql
  # Tracks the set of tables referenced in a query with one primary table
  # and any number of additional join tables.
  class QueryTables
    attr_reader :primary_table, :tables, :joins

    def initialize(query_ast, primary_table)
      @query_ast = query_ast
      @primary_table = Sql::QueryTable.table(primary_table)
      @table_aliases = {  }
      @tables = []
      @joins = []
      @alias_index = 0
    end

    def lookup!(table)
      return lookup!(primary_table) if table.equal?(@query_ast)

      found_table = self[table.alias]
      unless found_table
        return register_table(@primary_table) if table == @primary_table
        raise("Lookup failed: #{table} is not in #{self}")
      end
      found_table
    end

    def find_join(join_condition)
      @joins.find { |j|
        j.tables_match?(join_condition)
      }
    end

    def register_table(table, force_new_alias=false)
      return table if !force_new_alias && self[table.alias] == table

      # Is this table's alias already taken? Give it a new one if so
      new_alias = table.alias
      if self[new_alias]
        new_alias = disambiguate_alias(table.alias)
        table.alias = new_alias
      end
      record_table(table)
      @table_aliases[new_alias] = table
    end

    def [](table_alias)
      table_alias = table_alias.alias if table_alias.respond_to?(:alias)
      @table_aliases[table_alias]
    end

    def table(table_name)
      @tables.find { |t| t.name == table_name }
    end

    def join(join_condition)
      if @joins.include?(join_condition)
        update_join_table_aliases(join_condition)
        return
      end

      register_table(join_condition.left_table)
      register_table(join_condition.right_table, :force_new_alias)

      @joins << join_condition
      self
    end

    ##
    # Returns the table name and joins, suitable for the FROM clause
    # of a query.
    def to_sql
      sql_frags = []
      if !@joins.empty?
        include_left_table = true
        for join in @joins
          sql_frags << join.to_sql(include_left_table)
          include_left_table = false
        end
      else
        sql_frags = primary_table.to_sql
      end
      sql_frags.join(' ')
    end

    ##
    # Returns any SQL ? placeholder values from JOINed subqueries.
    def values
      values = []
      include_left_table = true
      @joins.each { |j|
        values += j.values(include_left_table)
        include_left_table = false
      }
      values
    end

    def to_s
      "QueryTables[#{@tables.map(&:name).join(',')}]"
    end

  private

    def record_table(table)
      @tables << table unless known_table?(table)
    end

    def known_table?(table)
      @tables.index(table)
    end

    def update_join_table_aliases(join)
      existing_join = @joins.find { |j| j == join }
      join.left_table.alias = existing_join.left_table.alias
      join.right_table.alias = existing_join.right_table.alias
    end

    def disambiguate_alias(table_alias)
      while true
        @alias_index += 1
        new_alias = "#{table_alias}_#{@alias_index}"
        return new_alias unless self[new_alias]
      end
    end
  end
end
