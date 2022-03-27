# Delete all data
SlotDistanceDetail.delete_all()
# Generate slot and entry point distance mapping
EntryPoint.all.find_each do |entry_point|
  ParkingSlot.all.find_each do |parking_slot|
    # Random distance in meters (It is not accurate )
    distance_in_mtr = rand(1..1000)
    # Add distance between slot and entrypoint
    SlotDistanceDetail.create!(entry_point_id: entry_point.id, parking_slot_id: parking_slot.id, distance_in_mtr: distance_in_mtr)
  end
end