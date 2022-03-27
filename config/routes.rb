Rails.application.routes.draw do
  root "slots#list"

  # Slots
  get '/slots/list' => "slots#list"
  post '/slots/list' => "slots#filter_slots"

  # Slot Bookings
  get 'slot_bookings/new'
  post 'slot_bookings/save'
  get 'slot_bookings/booking_confirmation'
  get 'slot_bookings/history'
  post 'slot_bookings/history'
  get 'slot_bookings/vehicles_first_entry'

end
