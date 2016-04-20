# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create!(name: "Big Data")
Category.create!(name: "Data Science ")
Category.create!(name: "FrontEnd Specialist")
Category.create!(name: "BackEnd Specialist")
Category.create!(name: "Database Systems")
Category.create!(name: "Mobile")

30.times do
  Coder.create!(name: Faker::Name.name,
                experience: 10.times.map { Faker::Company.catch_phrase },
                cost: Faker::Commerce.price,
                image_url: "http://api.randomuser.me/portraits/thumb/#{['men', 'women'].sample}/#{rand(96)}.jpg",
                category: Category.all.order("Random()").first)
end




































































































































































