require_relative('../db/sql_runner')

class Manufacturer

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
    name
    )
    VALUES
    (
    $1
    )
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE manufacturers SET
    (
    id,
    name
    )
    =
    (
    $1, $2
    )
    WHERE id = $3"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    manufacturer_data = SqlRunner.run(sql)
    makes = map_items(manufacturer_data)
    return makes
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    name = Manufacturer.new(result)
    return name
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def self.map_items(manufacturer_data)
    return manufacturer_data.map {|make| Manufacturer.new(make)}
  end

end
