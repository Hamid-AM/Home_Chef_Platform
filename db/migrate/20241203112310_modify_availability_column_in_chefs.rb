class ModifyAvailabilityColumnInChefs < ActiveRecord::Migration[7.1]
  def change
    change_column :chefs, :availability, :datetime, using: 'availability::timestamp'
  end
end
