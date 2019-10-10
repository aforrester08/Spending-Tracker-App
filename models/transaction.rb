require_relative("../db/sql_runner.rb")
# require_relative("tag.rb")
# require_relative("merchant.rb")

class Transaction

  attr_reader :id, :merchant_id, :tag_id, :amount, :time_stmp

  def initialize( options )
    @id = options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @amount = options['amount']
    @time_stmp = options['time_stmp']
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, tag_id, amount) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@merchant_id, @tag_id, @amount]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
    @time_stmp = Time.now.getutc
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new( results.first() )
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run(sql, values)
    return Tag.new( results.first() )
  end

  def update()
    sql = "UPDATE transactions SET
      (
        merchant_id,
        tag_id,
        amount
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@merchant_id, @tag_id, @amount, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map { |transaction| Transaction.new(transaction) }
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE
    id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first
    return Transaction.new( results )
  end

  def self.search_(params)
    sql = "SELECT * FROM merchants AND tags AND transactions WHERE
    params = "
    values = [merchant_id]
    results = SqlRunner.run(sql, values)
    return results.map { |transaction| Transaction.new(transaction)  }
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

end
