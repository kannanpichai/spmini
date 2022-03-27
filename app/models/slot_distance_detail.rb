class SlotDistanceDetail < ApplicationRecord
  belongs_to :entry_point
  belongs_to :parking_slot

  validates_presence_of :distance_in_mtr, :entry_point_id, :parking_slot_id

  # Fetch only available slots
  scope :slot_with_no_active_bookings, -> {
    where.not(parking_slot_id: SlotBooking.where('expiry_at > ?', Time.now).select(:parking_slot_id))
  }

end
