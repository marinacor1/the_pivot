class HomesController < ApplicationController
  def show
    @city = City.find_by(slug: params[:city] )
    @home = Home.find(params[:id])
    @reservation = Reservation.new
  end
end
