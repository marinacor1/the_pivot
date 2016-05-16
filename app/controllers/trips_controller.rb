class TripsController < ApplicationController

  def show
    if current_user.nil?
      render file: '/public/404'
    else
      @trips = [1, 2, 3, 4]
    end
  end

  def create
    # do I really need to pass in current_user?
    r_processor = ReservationProcessor.new(session[:cart], current_user)
    # ReservationProcessor.create_trip(session[:cart], current_user)
    r_processor.create_trip

    require "pry"
    binding.pry

    flash[:notice] = "Trip Booked!"
    session[:cart] = {}
    redirect_to trips_path
  end

end
