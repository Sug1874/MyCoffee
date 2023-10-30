# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "user1",
            email: "user1@example.com",
            password: "password",
            password_confirmation: "password",
            activated: true,
            activated_at: Time.zone.now)

User.create!(name: "user2",
            email: "user2@example.com",
            password: "password",
            password_confirmation: "password",
            activated: true,
            activated_at: Time.zone.now)

user1 = User.find_by(email: "user1@example.com")
user2 = User.find_by(email: "user2@example.com")
20.times do |i|
  user1.items.create!(
    name: "Item#{i+1}",
    bitterness: 1, acidity: 1, body: 1, 
    roast: "Light", 
    variety: "Typica",
    process: "Natural",
    farm: "abcfarm",
    shop_url: "example.com/items/#{i+1}",
    description: "test"*i
  )
end

20.times do |i|
  user2.items.create!(
    name: "Item#{i+11}",
    bitterness: 1, acidity: 1, body: 1, 
    roast: "Light",
    variety: "Typica",
    process: "Natural",
    farm: "abcfarm",
    shop_url: "example.com/items/#{i+11}",
    description: "test"*i
  )
end

user1.items.first.tastes.create!(
  taste: "Lemon"
)
user1.items.first.tastes.create!(
  taste: "Citrus"
)

user1.items.first.areas.create!(
  area: "Kenya"
)

user2.items.first.tastes.create!(
  taste: "Sweet"
)
user2.items.first.tastes.create!(
  taste: "Chocolate"
)
user2.items.first.areas.create!(
  area: "Brazil"
)
user2.items.first.areas.create!(
  area: "Colombia"
)