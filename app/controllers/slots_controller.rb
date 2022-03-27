class SlotsController < ApplicationController

  def list
    # Fetch all slot bookings
    @slots = SlotBooking.includes(:parking_slot).order(booked_at: :desc)
  end

  def filter_slots
    # Fetch slots that are used on the selected date
    # Get date from input
    @selected_date = filterparams[:date_filter]
    if not @selected_date.empty?
      @slots = SlotBooking.includes(:parking_slot)
                          .where("booked_at::date=?",[@selected_date])
                          .order(booked_at: :desc)
      render :list
    else
      flash[:error] = "Please select date!"
      redirect_to(:action => 'list')
    end
  end

  private
  def filterparams
    params.permit(:date_filter)
  end

end
