# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Review.destroy_all
Booking.destroy_all
Menu.destroy_all
Chef.destroy_all
User.destroy_all

user1 = User.create!(
  name: 'Bob',
  email: 'bob@gmail.com',
  password: 'password123',
  role: 'client'
)

user2 = User.create!(
  name: 'Karl',
  email: 'karl@gmail.com',
  password: 'password123',
  role: 'client'
)

chef_user = User.create!(
  name: 'Stef',
  email: 'stef@gmail.com',
  password: 'password123',
  role: 'chef'
)

chef_user = User.create!(
  name: 'Juan',
  email: 'juan@gmail.com',
  password: 'password123',
  role: 'chef'
)

chef_user = User.create!(
  name: 'Rob',
  email: 'rob@gmail.com',
  password: 'password123',
  role: 'chef'
)

chef1 = Chef.create!(
  user: chef_user,
  name: 'Chef Stef',
  specialties: Faker::Food.dish,
  biography: Faker::Lorem.paragraph(sentence_count: 3),
  availability: 'Monday to Friday, 10am - 6pm',
  location: Faker::Address.city
)

chef2 = Chef.create!(
  user: chef_user,
  name: 'Chef Juan',
  specialties: Faker::Food.dish,
  biography: Faker::Lorem.paragraph(sentence_count: 3),
  availability: 'Monday to Friday, 10am - 6pm',
  location: Faker::Address.city
)

chef3 = Chef.create!(
  user: chef_user,
  name: 'Chef Rob',
  specialties: Faker::Food.dish,
  biography: Faker::Lorem.paragraph(sentence_count: 3),
  availability: 'Monday to Friday, 10am - 6pm',
  location: Faker::Address.city
)

menus = []
3.times do
  menus << Menu.create!(
    chef: chef1,
    title: Faker::Food.dish,
    description: Faker::Food.description,
    price: Faker::Commerce.price(range: 10..50)
  )
end

menus = []
3.times do
  menus << Menu.create!(
    chef: chef2,
    title: Faker::Food.dish,
    description: Faker::Food.description,
    price: Faker::Commerce.price(range: 10..50)
  )
end

menus = []
3.times do
  menus << Menu.create!(
    chef: chef3,
    title: Faker::Food.dish,
    description: Faker::Food.description,
    price: Faker::Commerce.price(range: 10..50)
  )
end

bookings = []
bookings << Booking.create!(
  user: user1,
  menu: menus.sample,
  date: Faker::Date.forward(days: 10),
  time: Faker::Time.forward(days: 10, period: :evening),
  status: ['pending', 'confirmed', 'cancelled'].sample,
  notes: Faker::Lorem.sentence(word_count: 10)
)

bookings << Booking.create!(
  user: user2,
  menu: menus.sample,
  date: Faker::Date.forward(days: 15),
  time: Faker::Time.forward(days: 15, period: :morning),
  status: ['pending', 'confirmed', 'cancelled'].sample,
  notes: Faker::Lorem.sentence(word_count: 10)
)

bookings.each do |booking|
  Review.create!(
    booking: booking,
    user: booking.user,
    rating: rand(1..5),
    comment: Faker::Lorem.sentence(word_count: 15)
  )
end
