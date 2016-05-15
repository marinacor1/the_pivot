class Api::V1::ReservationsController < ApplicationController
  respond_to :json

  def create
    formatted_data = format_ajax_data(reservation_params)
    reservation = Reservation.create(formatted_data)

    Day.book(reservation)

    respond_with reservation,
      location: -> { api_v1_reservations_path(reservation) }
  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end

  def format_ajax_data(reservation_params)
    check_in  = reservation_params[:startDate].to_date
    check_out = reservation_params[:endDate].to_date
    home_id   = reservation_params[:homeId].to_i
    user_id   = current_user.id

    {
      home_id: home_id,
      check_in: check_in,
      check_out: check_out,
      user_id: user_id
    }
  end
end
