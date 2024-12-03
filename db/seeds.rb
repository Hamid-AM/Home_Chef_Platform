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

# Create Users
puts "Creating users..."
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    name: Faker::Name.name
  )

  # Create Chefs (1 out of every 2 users becomes a chef)
  if rand(2).even?
    chef = Chef.create!(
      user: user,
      biography: Faker::Lorem.paragraph(sentence_count: 2),
      specialties: Faker::Food.ethnic_category,
      availability: "Weekdays, Weekends",
      location: Faker::Address.city
    )

    # Create Menus for the chef
    rand(1..3).times do
      Menu.create!(
        chef: chef,
        title: Faker::Food.dish,
        description: Faker::Food.description,
        price: rand(15..100)
      )
    end
  end
end
