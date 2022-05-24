# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Van.destroy_all
User.destroy_all

lara = User.new({
  first_name: 'Lara',
  last_name: "Keen",
  email: "lara@vanners.com",
  password: "lara@vanners.com",
})
lara.save

laura = User.new({
  first_name: 'Laura',
  last_name: "Gonzalez",
  email: "laura@vanners.com",
  password: "laura@vanners.com",
})
laura.save

david = User.new({
  first_name: 'David',
  last_name: "Mendoza",
  email: "david@vanners.com",
  password: "david@vanners.com",
})
david.save

judith = User.new({
  first_name: 'Judith',
  last_name: "van Leersum",
  email: "judith@vanners.com",
  password: "judith@vanners.com",
})
judith.save

van_1 = Van.new({
  title: "Roady the Luxury camper van",
  description: "The vehicle has everything you need to rough it in comfort. Airstream has done a lot to maximize space in its climate-controlled cabin. A modular dining table doubles as a desk, and it can be easily converted into the largest sleeping area in a Class B Motorhome. There's also a full mini kitchen and bathroom. You can take the van off-roading, too. In addition to a 3.0-liter turbo-diesel V-6 engine that churns out 188 hp and 325 ft lbs of torque, it also comes equipped with four-wheel drive, a height-adjustable suspension and all-terrain tires.",
  price: 33
})
van_1.user = lara
van_1.save

van_2 = Van.new({
  title: "Jacky the Terrain warrior",
  description: "As the name suggests, Jacky is designed for off-roading, with a turbo-diesel V-6, Koni shocks, a rear stabilizer and a rear hitch strong enough to tow an additional trailer if you need more room. Inside, it's a little spartan compared to some other options on this list, but its kitchenette can be converted into a sleeping area with room for a full-size bed, as well as plenty of storage space beneath. There's even a built-in awning when you need some shade in the summer months.",
  price: 45
})
van_2.user = david
van_2.save

van_3 = Van.new({
  title: "Storyteller Overland Beast Mode",
  description: "Its slick retro-style livery is offset with loads of useful off-roading gear, too, like an LED light package, roof rack and side ladder and custom wheels wrapped in BF Goodrich K02 tires. Inside, you'll find everything you need to relax after a day of exploring, including a cushy lounge that can be converted to a full-size sleeping area. There's even a climate control system to ensure you're comfortable no matter the weather outside.",
  price: 39
})
van_3.user = lara
van_3.save

booking_1 = Booking.new({
  date_from: "01-06-2022",
  date_until: "08-07-2022",
  status: "accepted"
})
booking_1.van = van_1
booking_1.user = judith
booking_1.save

booking_2 = Booking.new({
  date_from: "07-08-2022",
  date_until: "17-08-2022",
  status: "pending"
})
booking_2.van = van_3
booking_2.user = laura
booking_2.save
