class CreateSlotDistanceDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :slot_distance_details do |t|
      t.references :entry_point, foreign_key: true
      t.references :parking_slot, foreign_key: true
      t.decimal :distance_in_mtr,  null: false
      t.timestamps
    end
  end
end
