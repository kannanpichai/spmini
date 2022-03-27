class CreateParkingSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_slots do |t|
      t.string :slot_no, null: false
      t.timestamps
    end
  end
end
