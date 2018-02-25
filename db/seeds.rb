require_relative('../models/club')
require_relative('../models/manufacturer')
require('pry-byebug')

Club.delete_all
Manufacturer.delete_all

manu1 = Manufacturer.new({
    "name" => "Taylormade"
})

manu1.save()

manu2 = Manufacturer.new({
    "name" => "Callaway"
})

manu2.save()

manu3 = Manufacturer.new({
    "name" => "Ben Sayers"
})

manu3.save()

manu4 = Manufacturer.new({
    "name" => "Titleist"
})

manu4.save()

club1 = Club.new({
  "name" => "M1 driver",
  "type" => "driver",
  "manufacturer_id" => manu1.id,
  "quantity" => 10,
  "stock_level" => "med"
  })

club1.save()

club2 = Club.new({
  "name" => "M2 driver",
  "type" => "driver",
  "manufacturer_id" => manu1.id,
  "quantity" => 20,
  "stock_level" => "high"
  })

club2.save()


binding.pry
nil