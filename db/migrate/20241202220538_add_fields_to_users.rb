class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string, default: 'client', null: false
  end
end
