class CreateSlotBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :slot_bookings do |t|
      t.string :vehicle_reg_no, null: false # Vehicle registeration number (should not be null)
      t.string :name # Driver name or vehicle owner name (optional)
      t.references :entry_point, foreign_key: true # Booked on which entry point
      t.references :parking_slot, foreign_key: true # Allocated parking slot
      t.datetime :booked_at,  default: -> { 'CURRENT_TIMESTAMP' } # Entry date and time
      t.integer :duration_in_hrs, null: false, default: 1 # Default parking hours
      t.text :note # Extra note (optional)
      t.timestamps
    end
  end
end
