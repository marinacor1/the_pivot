class HomesController < ApplicationController

  def show
    @home = Home.find(params[:id])
    @city = City.find_by(slug: params[:city] )
    @reservation = Reservation.new
    render file: 'public/404', status: 404 unless @home.online?
  end

  def edit
    @city = City.find_by(slug: params[:city])
    @home = Home.find(params[:id])
  end

  def update
    @city = City.find_by(slug: params[:city])
    @home = Home.find(params[:id])
    if @home.update(params_check)
      flash[:error] = "Success! Your home updated."
      redirect_to city_home_path(@city, @home)
    else
      flash[:error] = "Your home could not be updated. Please check your input and try again."
    end
  end

  private

  def params_check
    params.require(:home).permit(:image_url, :address, :zip_code, :title, :description, :daily_rate, :online)
  end
end
