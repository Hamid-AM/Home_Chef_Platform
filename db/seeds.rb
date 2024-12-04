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

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password123',
    name: Faker::Name.name,
    role: 'chef',
    specialties: Faker::Food.dish,
    biography: Faker::Lorem.paragraph(sentence_count: 3),
    availability: ['Morning', 'Afternoon', 'Evening'].sample,
    location: Faker::Address.city
  )
end

# Create 5 clients
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password123',
    name: Faker::Name.name,
    role: 'client',
    specialties: nil,
    biography: nil,
    availability: nil,
    location: Faker::Address.city
  )
end

# Create 5 menus for chefs
User.where(role: 'chef').each do |chef|
  1.times do
    chef.menus.create!(
      title: Faker::Food.dish,
      description: Faker::Food.description,
      price: Faker::Commerce.price(range: 10.0..50.0)
    )
  end
end

# Create 5 bookings for clients
User.where(role: 'client').each do |client|
  1.times do
    menu = Menu.all.sample
    client.bookings.create!(
      menu_id: menu.id,
      date: Faker::Date.forward(days: 10),
      time: Faker::Time.forward(days: 10, period: :evening),
      total_price: menu.price,
      status: 'pending',
      notes: Faker::Lorem.sentence
    )
  end
end

# Create reviews for bookings
Booking.all.each do |booking|
  booking.reviews.create!(
    user_id: booking.user_id, # client
    menu_id: booking.menu_id,
    booking_id: booking.id,
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph(sentence_count: 2)
  )
end
