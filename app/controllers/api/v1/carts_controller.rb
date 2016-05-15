class Api::V1::CartsController < ApplicationController
  respond_to :json

  def create
    reservation = formatted_reservation_data(reservation_params)
    @cart.add_reservation(reservation)
    session[:cart] = @cart.contents

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

    #### After checkout is hit
    # PORO steps in
    # Day.book(reservation)
    # reservation.pending = false

    respond_with @cart,
      location: -> { api_v1_carts_path(@cart) }
  end


  # helper methods?
  def reservation_params
    params.require(:data).permit("checkIn", "checkOut", "homeId")
  end

  def formatted_reservation_data(data)
    {
      data[:homeId].to_i => {
                              check_in:  data[:checkIn].to_date,
                              check_out: data[:checkOut].to_date,
                              # user_id:   current_user.id
                              # home_name
                              # total_stay
                            }
    }
  end

end
