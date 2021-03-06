# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.save!



order = Order.create!(order_number: "24601", user: User.find(1))
order.line_items.create!(name: "Settlers of Catan", unit_price: 29.95, quantity: 1)
order.line_items.create!(name: "Technodrome", unit_price: 24.99, quantity: 2)
order.line_items.create!(name: "RailsCasts Pro Subscription", unit_price: 9.00, quantity: 1)
order.line_items.create!(name: "Flux Capacitor", unit_price: 1955.00, quantity: 1)
order.line_items.create!(name: "TextMate 2", unit_price: 75.00, quantity: 3)
