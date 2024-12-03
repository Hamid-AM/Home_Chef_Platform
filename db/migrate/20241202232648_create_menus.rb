class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|
      t.references :chef, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
