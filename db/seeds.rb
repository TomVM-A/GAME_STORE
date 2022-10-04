require_relative '../app/models/game'

# TODO: Write a seed to insert 100 posts in the database
puts 'Creating 100 fake games...'
100.times do |y|
  Game.create!(
    title: Faker::Game.title,
    category: Faker::Game.genre,
    price: rand(0..100),
    user: User.create!(
      email: "user#{y + 1}@gmail.com",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: "123456789",
      dni: "1252515251#{y + 1}",
      date_of_birth: "19/08/1995"
    )
  )
end
