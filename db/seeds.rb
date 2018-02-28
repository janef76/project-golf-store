require_relative('../models/club')
require_relative('../models/manufacturer')
require_relative('../models/type')
require('pry-byebug')

Club.delete_all
Manufacturer.delete_all
Type.delete_all

manu1 = Manufacturer.new({
    "name" => "Ben Sayers"
})

manu1.save()

manu2 = Manufacturer.new({
    "name" => "Callaway"
})

manu2.save()

manu3 = Manufacturer.new({
    "name" => "Nike"
})

manu3.save()

manu4 = Manufacturer.new({
    "name" => "Taylormade"
})

manu4.save()

manu5 = Manufacturer.new({
    "name" => "Titleist"
})

manu5.save()

type1 = Type.new({
    "name" => "driver"
})

type1.save()

type2 = Type.new({
    "name" => "fairway woods"
})

type2.save()

type3 = Type.new({
    "name" => "irons"
})

type3.save()

type4 = Type.new({
    "name" => "putters"
})

type4.save()

type5 = Type.new({
    "name" => "wedges"
})

type5.save()

club1 = Club.new({
  "name" => "M1 driver",
  "type_id" => type1.id,
  "manufacturer_id" => manu4.id,
  "quantity" => 15,
  "stock_level" => "med",
  "buy_price" => 300,
  "sell_price" => 450,
  "mark_up" => 150
  })

club1.save()

club2 = Club.new({
  "name" => "917 3 wood",
  "type_id" => type2.id,
  "manufacturer_id" => manu5.id,
  "quantity" => 2,
  "stock_level" => "low",
  "buy_price" => 200,
  "sell_price" => 250,
  "mark_up" => 50
  })

club2.save()

club3 = Club.new({
  "name" => "XJ20 3-pw",
  "type_id" => type3.id,
  "manufacturer_id" => manu2.id,
  "quantity" => 25,
  "stock_level" => "high",
  "buy_price" => 400,
  "sell_price" => 600,
  "mark_up" => 200
  })

club3.save()

club4 = Club.new({
  "name" => "FX 2",
  "type_id" => type4.id,
  "manufacturer_id" => manu1.id,
  "quantity" => 11,
  "stock_level" => "med",
  "buy_price" => 20,
  "sell_price" => 35,
  "mark_up" => 15
  })

club4.save()

club5 = Club.new({
  "name" => "V forged 60 loft",
  "type_id" => type5.id,
  "manufacturer_id" => manu3.id,
  "quantity" => 21,
  "stock_level" => "high",
  "buy_price" => 40,
  "sell_price" => 60,
  "mark_up" => 20
  })

club5.save()

binding.pry
nil
