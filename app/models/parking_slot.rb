class ParkingSlot < ApplicationRecord
  has_many :slot_bookings, dependent: :destroy
  has_many :slot_distance_details, dependent: :destroy

  validates_presence_of :slot_no

end
