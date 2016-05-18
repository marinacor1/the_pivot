class Api::V1::ReservationsController < ApplicationController
  respond_to :json

  def create
    # double check? One when add to cart, One when Checkout
    # before create check Day.where(date: check_in..check_out).count
    # => if count > 0 - error out and return flash message
    # => redirect to Home page

    formatted_data = format_ajax_data(reservation_params)
    res = Reservation.create(formatted_data)

    # create required dates - don't depend on seeded / pre-existing
    # create array of dates - iterate through and create days

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
