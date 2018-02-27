require_relative('../db/sql_runner')

class Club

  attr_reader :id
  attr_accessor :name, :type_id, :manufacturer_id, :quantity, :stock_level, :buy_price, :sell_price, :mark_up

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type_id = options['type_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @quantity = options['quantity'].to_i
    @stock_level = options['stock_level']
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @mark_up = options['mark_up'].to_i
  end

  def level_indicator()
    if @quantity > 0 && @quantity <= 10
      return "low"
    elsif @quantity > 10 && @quantity <= 20
      return "med"
    else
      return "high"
    end
  end

  def mark_up_value()
    @mark_up = @sell_price - @buy_price
  end

  def save()
    sql = "INSERT INTO clubs
    (
    name,
    type_id,
    manufacturer_id,
    quantity,
    stock_level,
    buy_price,
    sell_price,
    mark_up
    )
    VALUES
    (
    $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@name, @type_id, @manufacturer_id, @quantity, @stock_level, @buy_price, @sell_price, @mark_up]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE clubs SET
    (
    name,
    type_id,
    manufacturer_id,
    quantity,
    buy_price,
    sell_price
    )
    =
    (
    $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @type_id, @manufacturer_id, @quantity, @buy_price, @sell_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM clubs WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM clubs"
    club_data = SqlRunner.run(sql)
    clubs = map_items(club_data)
    return clubs
  end

  def self.find(id)
    sql = "SELECT * FROM clubs WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    club = Club.new(result)
    return club
  end

  def self.delete_all()
    sql = "DELETE FROM clubs"
    SqlRunner.run( sql )
  end

  def self.map_items(club_data)
    return club_data.map {|club| Club.new(club)}
  end

end
