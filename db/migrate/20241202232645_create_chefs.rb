class CreateChefs < ActiveRecord::Migration[7.1]
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :specialties
      t.text :biography
      t.string :availability
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
