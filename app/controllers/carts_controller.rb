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


  # def destroy
  #   task = Task.find(params[:id])
  #   @cart.remove_task(task.id)
  #   flash[:notice] = "Successfully removed #{task.link} from your cart."
  #   redirect_to cart_path
  # end


  # def index
  #   require "pry"
  #   binding.pry
  #   @reservations = Reservation.find(@cart.contents.keys)
  # end
  #
  # def create
  #   coder = Coder.find(params[:coder_id])
  #   # flash[:notice] = "Coder has already been added" if @cart.contents.keys.include?(coder.id.to_s)
  #   @cart.add_coder(coder.id)
  #   session[:cart] = @cart.contents
  #   redirect_to coders_path
  # end
  #
  # def destroy
  #   @cart.remove_coder(params[:id])
  #   session[:cart] = @cart.contents
  #   coder = Coder.find(params[:id])
  #   flash[:message] =  "Successfully removed #{ActionController::Base.helpers.link_to coder.name, coder_path(coder.id)} from your team.".html_safe
  #   redirect_to teams_path
  # end
end
