require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @cols if @cols

    columns = DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      #{self.table_name}
    SQL

    @cols = columns.first.map!(&:to_sym)
  end

  def self.finalize!
    self.columns
    @cols.each do |col|
      define_method(col) { self.attributes[col] }
    end

    @cols.each do |col|
      define_method("#{col}=") { |value| self.attributes[col] = value }
    end
  end

  def self.table_name=(table_name)
    @table = table_name
  end

  def self.table_name
    @table || self.name.underscore.pluralize
  end

  def self.all
    all = DBConnection.execute(<<-SQL)
    SELECT
    #{self.table_name}.*
    FROM
    #{self.table_name}
    SQL
    self.parse_all(all)
  end

  def self.parse_all(results)
    objects = []
    results.each do |result|
      objects << self.new(result)
    end
    objects
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      id = #{id}
    SQL
    self.parse_all(result).first
  end

  def initialize(params = {})
    column_list = self.class.columns
    params.each do |k, v|
      name = k.to_sym
      raise "unknown attribute '#{name}'" unless column_list.include?(name)
      self.send("#{name}=", v)
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    marks = (["?"] * columns.count).join(", ")


    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT into
        #{self.class.table_name} (#{col_names})

  end

  def update
    # ...
  end

  def save
    # ...
  end
end
