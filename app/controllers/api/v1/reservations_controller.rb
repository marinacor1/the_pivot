class Api::V1::ReservationsController < ApplicationController

  def create
    require "pry"
    binding.pry
    Reservation.create(reservation_params)
    start_date = reservation_params[:startDate]
    Day.create(date: start_date)
    end_date = reservation_params[:endDate]
    Day.create(date: end_date)
    home = Home.find(reservation_params[:homeId])
  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end
end
