require_relative('../db/sql_runner.rb')

class Budget

  attr_reader :id
  attr_accessor :amount

  def initialize(options)
    @id = options['id']
    @amount = options['amount']
  end

  def save()
    sql = "INSERT INTO budget
    (amount) VALUES ($1)
    RETURNING id"
    values =[@amount]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE budget SET
      (amount) = ($1)
      WHERE id = $2"
      values = [@amount, @id]
      SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM budget"
    results = SqlRunner.run(sql)
    return results.map { |budget| Budget.new(budget) }
  end

  def self.find(id)
    sql = "SELECT * FROM budget WHERE
    id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Budget.new( results.first() )
  end

  def self.delete_all()
    sql = "DELETE FROM budget"
    SqlRunner.run(sql)
  end

end
