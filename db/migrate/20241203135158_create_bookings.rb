class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.datetime :date_time
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
