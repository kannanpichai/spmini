class AddExpiryAtToSlotBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :slot_bookings, :expiry_at, :datetime
  end
end
