require_relative('../db/sql_runner')

class Type

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO types
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
    sql = "UPDATE types SET
    name
    =
    $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM types WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM types
    ORDER BY types"
    type_data = SqlRunner.run(sql)
    types = map_items(type_data)
    return types
  end

  def self.find(id)
    sql = "SELECT * FROM types
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    name = Type.new(result)
    return name
  end

  def self.delete_all()
    sql = "DELETE FROM types"
    SqlRunner.run(sql)
  end

  def self.type_name(id)
    sql = "SELECT name FROM types WHERE id = #{id};"
    results = SqlRunner.run(sql)[0]['name']
    return results
  end


  def self.map_items(type_data)
    return type_data.map {|type| Type.new(type)}
  end
end
