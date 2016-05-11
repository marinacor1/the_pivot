class CitiesController < ApplicationController
  def show
    @city = City.find_by(slug: params[:city])
  end
end
