class SlotBooking < ApplicationRecord
  belongs_to :entry_point
  belongs_to :parking_slot

  validates_presence_of :vehicle_reg_no, :entry_point_id, :parking_slot_id, :duration_in_hrs
  validates :vehicle_reg_no, length: { minimum: 5 }

  validate :should_not_be_in_parking_already, on: :create

  # Custom validator to check if slot already allocated for the vehicle
  def should_not_be_in_parking_already
      # Check if a slot is already booked and still active (still in parking) for the given vehicle reg no
      if SlotBooking.where(vehicle_reg_no: self.vehicle_reg_no)
                    .where("expiry_at > ?", Time.now)
                    .exists?
        errors.add(:vehicle_reg_no, "Parking slot already allocated for this vehicle")
      end
  end

  # To Check if booked slot reservation got over
  # @return [TrueClass, FalseClass]
  def is_parking_time_over?
    return expiry_at < Time.now
  end

end
