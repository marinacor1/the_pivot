class Api::V1::ReservationsController < ApplicationController

  def create
    require "pry"
    binding.pry
    Reservation.create(reservation_params)
  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end
end
