class ModifyBookingsToAddDateAndTime < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :date_time, :datetime
    add_column :bookings, :date, :datetime
    add_column :bookings, :time, :datetime
  end
end
