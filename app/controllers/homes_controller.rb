class HomesController < ApplicationController
  def show
    @city = City.find_by(slug: params[:city] )
    @home = Home.find(params[:id])
  end

  def update
    if @home.update(params_check)
      flash[:error] = "Success! Your home updated."
      redirect_to @home
    else
      flash[:error] = "Your home could not be updated. Please check your input and try again."
    end
  end


  private

  def params_check
    params.require(:home).permit(:image_url, :address, :zip_code, :title, :description, :daily_rate)
  end
end
