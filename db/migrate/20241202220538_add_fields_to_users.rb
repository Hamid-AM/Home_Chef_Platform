class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string, default: 'client', null: false
    add_column :users, :specialties, :string
    add_column :users, :biography, :text
    add_column :users, :availability, :string
    add_column :users, :location, :string
  end
end
