# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i|
  dealer = Dealer.create(email: "foo#{i}@bar.com", password: 'foobar01')
  dealer.dealerships.create(name: "Dealership #{i}", admin: dealer)
end

body_styles = ['SUV'  'Sedan', 'Sports Car', 'Mini van', 'Crossover', 'Hatchbacks', 'Convertibles', 'Coupes', 'Hybrid', 'Pickup truck', 'Luxury', 'Coupes', 'Convertibles']

body_styles.each do |body_style|
  BodyStyle.create(name: body_style)
end

ActiveRecord::Base.connection.execute(IO.read("db/cars.sql"))
