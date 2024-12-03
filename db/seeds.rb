# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Menu.create!([
  {
    chef_id: 1,
    title: "Gourmet Burger",
    description: "A delicious gourmet burger with truffle mayo and aged cheddar.",
    price: 15.99,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    chef_id: 2,
    title: "Vegan Delight",
    description: "A plant-based dish featuring seasonal vegetables and quinoa.",
    price: 49,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    chef_id: 3,
    title: "Seafood Pasta",
    description: "Fresh pasta with a creamy seafood sauce and herbs.",
    price: 109,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    chef_id: 2,
    title: "Steak and Potatoes",
    description: "Juicy ribeye steak served with garlic mashed potatoes and grilled asparagus.",
    price: 79,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    chef_id: 3,
    title: "Thai Green Curry",
    description: "Spicy and flavorful green curry with chicken, coconut milk, and fresh basil.",
    price: 14.75,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    chef_id: 4,
    title: "Sushi Platter",
    description: "An assortment of fresh sushi rolls, nigiri, and sashimi.",
    price: 22.50,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    chef_id: 2,
    title: "Pizza Margherita",
    description: "Classic Italian pizza with fresh mozzarella, basil, and tomatoes.",
    price: 11.99,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    chef_id: 5,
    title: "Mediterranean Platter",
    description: "Hummus, falafel, tabbouleh, and pita bread served with a side of tzatziki.",
    price: 16.25,
    created_at: Time.now,
    updated_at: Time.now
  }
])
