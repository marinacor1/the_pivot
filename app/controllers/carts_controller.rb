class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    @reservations = @cart.reservations
  end

  def destroy
    reservation = params[:format]
    @cart.remove_reservation(reservation)
    flash[:notice] = "Successfully removed Reservation from your cart."
    redirect_to cart_path
  end

end
