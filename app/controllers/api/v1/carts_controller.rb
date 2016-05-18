class Api::V1::CartsController < ApplicationController
  respond_to :json

  def create
    reservation = formatted_reservation_data(reservation_params)
    home = Home.find(reservation_params[:homeId])

    if @cart.has_reservation?(reservation_params[:homeId])
      flash.now[:notice] = "A similar reservation is already in your Cart!"

    elsif double_booked_days.count > 0
      days = double_booked_days.join(" ")
      flash.now[:notice] = "Reservation conflicts on #{days}"

    else
      flash.now[:notice] = "Pending Reservation added to Cart"
      @cart.add_reservation(reservation)
      session[:cart] = @cart.contents
    end

    respond_with @cart,
      location: -> { api_v1_carts_path(@cart) }
  end

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
                       }
    }
  end

  def double_booked_days
    home = Home.find(reservation_params[:homeId])
    home.days.pluck(:date) & (reservation_params[:checkIn].to_date..reservation_params[:checkOut].to_date).to_a
  end

end
