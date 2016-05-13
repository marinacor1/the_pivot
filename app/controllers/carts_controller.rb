class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @reservations = Reservation.find(@cart.contents.keys)
  end

  def create
    coder = Coder.find(params[:coder_id])
    # flash[:notice] = "Coder has already been added" if @cart.contents.keys.include?(coder.id.to_s)
    @cart.add_coder(coder.id)
    session[:cart] = @cart.contents
    redirect_to coders_path
  end

  def destroy
    @cart.remove_coder(params[:id])
    session[:cart] = @cart.contents
    coder = Coder.find(params[:id])
    flash[:message] =  "Successfully removed #{ActionController::Base.helpers.link_to coder.name, coder_path(coder.id)} from your team.".html_safe
    redirect_to teams_path
  end
end
