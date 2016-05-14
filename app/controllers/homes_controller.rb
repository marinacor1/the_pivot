class HomesController < ApplicationController
  def show
    @city = City.find_by(slug: params[:city] )
    @home = Home.find(params[:id])
  end

  def edit
    if current_user.host?
      @city = current_user.home.city
      @home = current_user.home
    else
      @city = City.find_by(slug: params[:city])
      @home = Home.find(params[:id])
    end
  end

  def update
    if current_user.host?
      @city = current_user.home.city
      @home = current_user.home
    else
      @city = City.find_by(slug: params[:city])
      @home = Home.find(params[:id])
    end

    if @home.update(params_check)
      flash[:error] = "Success! Your home updated."
      redirect_to city_home_path(@city, @home)
    else
      flash[:error] = "Your home could not be updated. Please check your input and try again."
    end
  end

  private

  def params_check
    params.require(:home).permit(:image_url, :address, :zip_code, :title, :description, :daily_rate)
  end
end
