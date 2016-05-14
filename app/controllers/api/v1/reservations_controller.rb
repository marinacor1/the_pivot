class Api::V1::ReservationsController < ApplicationController
  respond_to :json
  # respond_to :html

  def create
    # model
    start_date = reservation_params[:startDate].to_date
    end_date   = reservation_params[:endDate].to_date
    home_id    = reservation_params[:homeId].to_i
    # user_id = current_user.id

    reservation = Reservation.new(
      home_id: home_id,
      check_in: start_date,
      check_out: end_date
      )

    # ReservationBooker - PORO handles everything
    # => adds reservation to cart
    # => reservation.valid? && reservation.has_no_conflicts?
    # => Day.book(reservation)

    reservation.days << Day.where(date: start_date..end_date)

    # if reservation.valid? && reservation.has_no_conflicts?
    #   reservation.save
    # end

    # respond_with :api, :v1, reservation, location: -> { root_path }

    # respond_with carts_path(reservation.id)

     respond_with reservation, location: -> { cart_path(reservation.id) }

  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end
end
