class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.decimal :total_price
      t.string :status, default: 'pending'
      t.text :notes

      t.timestamps
    end
  end
end
