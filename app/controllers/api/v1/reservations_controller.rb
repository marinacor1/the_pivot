class Api::V1::ReservationsController < ApplicationController

  def create
  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end
end
