class SlotBookingsController < ApplicationController

  MAX_PARKING_DURATION = 3 # Slots will be available for booking once the existing slot booking got expired

  def history
    # Get vehicle registration number from input
    @vehicle_reg_no = params[:vehicle_reg_no]
    # Fetch history slot bookings of the given vehicle
    @vehicle_booking_history = SlotBooking.where(vehicle_reg_no: @vehicle_reg_no).order(booked_at: :desc)
  end

  def vehicles_first_entry
    # Fetch vehicles along with first ever entry time
    @vehicles_first_entry = SlotBooking.order(vehicle_reg_no: :asc).group("vehicle_reg_no").select("vehicle_reg_no, min(booked_at) as booked_at")
  end

  def new
    # Create new object for SlotBooking
    @slotbooking = SlotBooking.new
  end

  def save
    # Get selected entry point
    @entry_point_id = sbparams[:entry_point_id]
    # Get given vehicle registration number
    @vehicle_reg_no = sbparams[:vehicle_reg_no]
    # Add slot booking
    @slotbooking = SlotBooking.new
    @slotbooking.vehicle_reg_no = @vehicle_reg_no
    @slotbooking.entry_point_id = @entry_point_id
    @slotbooking.duration_in_hrs = MAX_PARKING_DURATION # In Future Enhancement, we can get this detail from input form
    @slotbooking.booked_at = Time.now # Current Date and Time
    @slotbooking.expiry_at = @slotbooking.booked_at + MAX_PARKING_DURATION.hours # Expiry at - when the slot should be released

    # Find nearest slot from the selected entry point
    @nearest_slot = fetch_nearest_available_parking_slot(@entry_point_id)
    # if not found, show an error message
    if @nearest_slot.nil?
      # Check if entry point is empty
      if @entry_point_id.empty?
        flash[:error] = "Please select an Entry point."
      else # IF entry point selected but no parking slot available
        flash[:error] = "Sorry! No slot available at the moment."
      end
      redirect_to(:action => 'new') and return
    end

    @slotbooking.parking_slot_id = @nearest_slot.parking_slot_id

    if @slotbooking.save # if saved successfully
        # Redirect to slot booked confirmation page
        redirect_to action: 'booking_confirmation', slot_no: @nearest_slot.parking_slot.slot_no and return
    end

    render :new, status: :unprocessable_entity

  end

  def booking_confirmation
    # Success page for slot booking
    @slot_no = params[:slot_no] # Allocated Parking Slot Number
  end

  private
  def fetch_nearest_available_parking_slot(entry_point_id)
    # SlotDistanceDetail model contains distance details  between entry points and parking slots
    # Distance will be in meters

    # Fetching available slot that is near by the given entry point
    return SlotDistanceDetail
             .where(entry_point_id: entry_point_id)
             .slot_with_no_active_bookings
             .select('parking_slot_id')
             .order("distance_in_mtr").first
  end

  private
  def sbparams
    params.require(:slot_booking).permit(:vehicle_reg_no, :entry_point_id)
  end

end
