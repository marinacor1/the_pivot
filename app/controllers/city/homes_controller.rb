class City::HomesController < ApplicationController
  def show
    @home = Home.find(params[:id])
  end
end
