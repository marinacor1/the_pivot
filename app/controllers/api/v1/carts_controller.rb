class Api::V1::CartsController < ApplicationController
  respond_to :json

  def create
    home_id = params.dig("data", "homeId")
    reservation = Home.find(home_id).reservations.where(user_id: current_user.id).last

    if @cart.has_reservation?(reservation.id) # || someone else reserved while in cart
      flash.now[:notice] = "These days are already reserved!"
    else
      @cart.add_reservation(reservation.id)
      session[:cart] = @cart.contents
      flash.now[:notice] = "Cart has been updated!"
    end

    respond_with @cart,
      location: -> { api_v1_carts_path(@cart) }
  end

end
