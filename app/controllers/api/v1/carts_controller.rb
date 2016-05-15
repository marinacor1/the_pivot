class Api::V1::CartsController < ApplicationController
  respond_to :json

  def create
    reservation = formatted_reservation_data(reservation_params)

    if @cart.has_reservation?(reservation_params[:homeId]) # check_in / check_out dates
      flash[:notice] = "A similar reservation is already in your Cart!"
    else
      flash[:notice] = "Pending Reservation added to Cart"
      @cart.add_reservation(reservation)
      session[:cart] = @cart.contents
    end

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


  # application helper methods?
  def reservation_params
    params.require(:data).permit("checkIn", "checkOut", "homeId")
  end

  def formatted_reservation_data(data)
    {
      data[:homeId] => {
                         check_in:   data[:checkIn].to_date,
                         check_out:  data[:checkOut].to_date,
                         home_title: Home.find(data[:homeId].to_i).title,
                         home_desc:  Home.find(data[:homeId].to_i).description,
                         # user_id:   current_user.id
                       }
    }
  end

end
