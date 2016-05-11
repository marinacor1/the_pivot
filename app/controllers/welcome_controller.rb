class WelcomeController < ApplicationController
  def show
    @cities = City.all
  end
end
