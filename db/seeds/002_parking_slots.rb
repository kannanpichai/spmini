# Create slots
total_slots = 1000
1.upto(total_slots).each do |slot_no|
  slot_external_id = "S#{slot_no}"
  ParkingSlot.find_or_create_by(slot_no: slot_external_id)
end