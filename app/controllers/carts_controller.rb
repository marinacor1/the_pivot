class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    # make sure Reservation has user_id at this point
    reservation = Reservation.find(params[:reservation_id])
    if @cart.has_reservation?(reservation.id)
      flash[:notice] = "These days are already reserved!"
    else
      @cart.add_reservation(reservation.id)
      session[:cart] = @cart.contents
      flash[:notice] = "Booking Requested!"
    end
    redirect_to request.referrer
  end

  def show
    @reservations = @cart.reservations
  end
end
