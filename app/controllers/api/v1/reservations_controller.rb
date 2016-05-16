class Api::V1::ReservationsController < ApplicationController
  respond_to :json

  def create
    formatted_data = format_ajax_data(reservation_params)
    res = Reservation.create(formatted_data)
    Day.book(res)
    respond_with res, location: -> { api_v1_reservations_path(res) }
  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end

  def format_ajax_data(reservation_params)
    {
      home_id:   reservation_params[:homeId].to_i,
      check_in:  reservation_params[:startDate].to_date,
      check_out: reservation_params[:endDate].to_date,
      user_id:   current_user.id
    }
  end
end
