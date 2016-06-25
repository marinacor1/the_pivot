class HomesController < ApplicationController

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(params_check)
    if @home.save
      @home.pending = true
      @home.city = City.find(params[:home][:city_id])
      @home.users << current_user
      @home.save
     flash[:action] = "Your request has been submitted for approval."
     redirect_to dashboard_path
    end
  end

  def show
    @home = Home.find(params[:id])
    @city = City.find_by(slug: params[:city] )
    @reservation = Reservation.new
    @reviews = @home.reviews
    binding.pry
    if @home.online? == false
      render file: 'public/404', status: 404
    end
  end

  def edit
    @city = City.find_by(slug: params[:city])
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])
    @city = @home.city
    if @home.update(params_check)
      flash[:error] = "Success! Your home updated."
      redirect_to city_home_path(@city, @home)
    else
      flash[:error] = "Your home could not be updated. Please check your input and try again."
    end
  end

  def index
    @homes = Home.all
    @pending_homes = @homes.find_all {|h| h.pending}
  end

  private

  def params_check
    params.require(:home).permit(:image_url, :address, :zip_code, :title, :description, :daily_rate, :online, :pending)
  end
end
