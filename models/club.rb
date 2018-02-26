require_relative('../db/sql_runner')

class Club

  attr_reader :id
  attr_accessor :name, :type, :manufacturer_id, :quantity, :stock_level

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @manufacturer_id = options['manufacturer_id'].to_i
    @quantity = options['quantity'].to_i
    @stock_level = options['stock_level']
  end

  def level_indicator()
    if @quantity <= 10
      return "low"
    elsif @quantity > 10 && @quantity <= 20
      return "med"
    else
      return "high"
    end
  end

  def save()
    sql = "INSERT INTO clubs
    (
    name,
    type,
    manufacturer_id,
    quantity,
    stock_level
    )
    VALUES
    (
    $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @type, @manufacturer_id, @quantity, @stock_level]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE clubs SET
    (id,
    name,
    type,
    manufacturer_id,
    quantity,
    stock_level
    )
    =
    (
    $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @type, @manufacturer_id, @quantity, @stock_level, @id]
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
