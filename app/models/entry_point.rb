class EntryPoint < ApplicationRecord
  has_many :slot_bookings, dependent: :destroy
  validates_presence_of :name

end
