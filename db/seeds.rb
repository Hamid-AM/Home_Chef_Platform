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

User.destroy_all
Chef.destroy_all
Menu.destroy_all
Booking.destroy_all

user1 = User.create!(
  name: 'Bob',
  email: 'bob@gmail.com',
  password: 'password123',
  role: 'client'
)

user2 = User.create!(
  name: 'karl',
  email: 'karl@gmail.com',
  password: 'password123',
  role: 'client'
)

# Creating a sample chef user
chef_user = User.create!(
  name: 'stef',
  email: 'stef@gmail.com',
  password: 'password123',
  role: 'chef'
)

chef1 = Chef.create!(
  user: chef_user,
  name: 'stef',
  specialties: Faker::Food.dish,
  biography: Faker::Lorem.paragraph(sentence_count: 3),
  availability: 'Monday to Friday, 10am - 6pm',
  location: Faker::Address.city
)

menu1 = Menu.create!(
  chef: chef1,
  title: Faker::Food.dish,
  description: Faker::Food.description,
  price: Faker::Commerce.price(range: 10..50)
)

menu2 = Menu.create!(
  chef: chef1,
  title: Faker::Food.dish,
  description: Faker::Food.description,
  price: Faker::Commerce.price(range: 10..50)
)

Booking.create!(
  user: user1,
  menu: menu1,
  date: Faker::Time.forward(days: 10, period: :morning),
  time: Faker::Time.forward(days: 10, period: :evening),
  status: ['pending', 'confirmed', 'cancelled'].sample,
  notes: Faker::Lorem.sentence(word_count: 10)
)

Booking.create!(
  user: user2,
  menu: menu2,
  date: Faker::Time.forward(days: 10, period: :morning),
  time: Faker::Time.forward(days: 10, period: :evening),
  status: ['pending', 'confirmed', 'cancelled'].sample,
  notes: Faker::Lorem.sentence(word_count: 10)
)
