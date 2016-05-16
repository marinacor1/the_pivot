class TripsController < ApplicationController

  def show
    if current_user.nil?
      render file: '/public/404'
    else
      @trips = Trip.where(user_id: current_user.id)
    end
  end

  def create
    # do I really need to pass in current_user?
    r_processor = ReservationProcessor.new(session[:cart], current_user)
    # ReservationProcessor.create_trip(session[:cart], current_user)
    r_processor.create_trip

    flash[:notice] = "Trip Booked!"
    session[:cart] = {}
    redirect_to trips_path
  end

end
