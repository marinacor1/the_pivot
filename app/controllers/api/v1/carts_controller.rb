class Api::V1::CartsController < ApplicationController
  respond_to :json

  def create
    raw_reservation = params[:data]

    # reformat raw_reservation (PORO?)
    # => Ruby syntax
    # => .to_date on start and end dates
    # structure it as the hash we'll pass into sessions[:cart]

    # reservation = formatted_reservation_hash
    # if @cart.has_reservation? # matching home_id with this current_user
    #   flash[:notice] = "An overlapping Trip is already in your Cart!"
    # else
    #   session[:cart] = reservation / formatted_reservation_hash
    #   flash[:notice] = "Pending Reservation added to Cart"
    # end

    @cart.add_reservation(1)
    session[:cart] = @cart.contents
    
    #### After checkout is hit
    # PORO steps in
    # Day.book(reservation)
    # reservation.pending = false

    respond_with @cart,
      location: -> { api_v1_carts_path(@cart) }
  end

  def test

  end

end
