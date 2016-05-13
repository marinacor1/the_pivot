class Api::V1::ReservationsController < ApplicationController

  def create
    # model
    start_date = reservation_params[:startDate].to_date
    end_date   = reservation_params[:endDate].to_date
    total_days = (end_date - start_date).to_i
    home_id    = reservation_params[:homeId].to_i
    # user_id = current_user.id

    # create ReservationDays (by finding existing Days in db)
    reservation   = Reservation.new(home_id: home_id)
    days          = Day.where(date: start_date..end_date)
    reserved_days = days.map { |day| ReservationDay.create(day_id: day.id) }

    reservation.reservation_days << reserved_days
    # reservation.save
    require "pry"
    binding.pry

    # Reservation has:
    # => start_date
    # => end_date
  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end
end
