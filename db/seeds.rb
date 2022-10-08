require_relative '../app/models/game'

# TODO: Write a seed to insert 100 posts in the database
puts "deleting all previous bookings"
Booking.delete(Booking.all)
puts "successfully deleted"
puts "deleting all previous games"
Game.delete(Game.all)
puts "successfully deleted"
puts "deleting all previous users"
User.delete(User.all)
puts "successfully deleted"

puts 'Creating 100 fake games...'
100.times do |y|
  game =  Game.create!(
            title: Faker::Game.title,
            category: Faker::Game.genre,
            price: rand(0..100),
            description: Faker::JapaneseMedia::StudioGhibli.quote,
            image: "https://images.unsplash.com/photo-1586182987320-4f376d39d787?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            user: User.create!(
              email: "user#{y + 1}@gmail.com",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: "123456789",
              dni: "1252515251#{y + 1}",
              date_of_birth: "19/08/1995"
            )
          )
  puts "# #{game.id} - Game and user was successfully created"
end
