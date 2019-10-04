require_relative("../db/sql_runner.rb")

class Tag

  attr_reader :id, :type

  def initialize( options )
    @id = options['id']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO tags
    (type) VALUES ($1)
    RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def merchants()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |tag| Merchant.new(tag) }
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    return results.map { |tag| Tag.new(tag) }
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE
    id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new( results.first() )
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end



end
