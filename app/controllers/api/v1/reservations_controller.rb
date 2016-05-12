class Api::V1::ReservationsController < ApplicationController

  def create
    start_date = reservation_params[:startDate].to_date
    end_date   = reservation_params[:endDate].to_date
    total_days = (end_date - start_date).to_i
    home_id    = reservation_params[:homeId].to_i

    # create day objects based off of range
    # create ReservationDays (find days in db)
    reservation = Reservation.new(home_id: home_id)
    reserved_days = []
    raw_date = start_date
    (total_days + 1).times do
      formatted_date = raw_date.strftime("%Y-%m-%d")
      day_id         = Day.find_by(date: formatted_date).id
      reserved_days << ReservationDay.create(day_id: day_id)
      raw_date = raw_date.next
    end

    reservation.reservation_days << reserved_days
    reservation.save
    
    # require "pry"
    # binding.pry

  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end
end
