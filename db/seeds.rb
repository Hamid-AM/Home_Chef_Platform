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

Menu.create!([
  {
    chef_id: 1,
    title: "Gourmet Burger",
    description: "A delicious gourmet burger with truffle mayo and aged cheddar.",
    price: 15.99,
  },
  {
    chef_id: 2,
    title: "Vegan Delight",
    description: "A plant-based dish featuring seasonal vegetables and quinoa.",
    price: 49,
  },
  {
    chef_id: 3,
    title: "Seafood Pasta",
    description: "Fresh pasta with a creamy seafood sauce and herbs.",
    price: 109,
  },
  {
    chef_id: 2,
    title: "Steak and Potatoes",
    description: "Juicy ribeye steak served with garlic mashed potatoes and grilled asparagus.",
    price: 79,
  },
  {
    chef_id: 3,
    title: "Thai Green Curry",
    description: "Spicy and flavorful green curry with chicken, coconut milk, and fresh basil.",
    price: 14.75,
  },
  {
    chef_id: 4,
    title: "Sushi Platter",
    description: "An assortment of fresh sushi rolls, nigiri, and sashimi.",
    price: 22.50,
  },
  {
    chef_id: 2,
    title: "Pizza Margherita",
    description: "Classic Italian pizza with fresh mozzarella, basil, and tomatoes.",
    price: 11.99,
  },
  {
    chef_id: 5,
    title: "Mediterranean Platter",
    description: "Hummus, falafel, tabbouleh, and pita bread served with a side of tzatziki.",
    price: 16.25,
  }
])


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
