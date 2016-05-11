class City::HomesController < ApplicationController
  def show
    @city = City.find_by(slug: params[:city])
    @homes = @city.homes
  end
end
