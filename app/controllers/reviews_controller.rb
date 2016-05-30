class ReviewsController < ApplicationController
  def new
    @review = Review.new(home_id: params[:home_id])
  end

  def create
    @review = Review.new(params_check)
    if @review.save
      @review.user_id = current_user.id
      @review.save
      @home = Home.find(params[:review][:home_id])
      #TODO reviews are being saved twice. One is nil and one is not.
      @home.reviews << @review
      flash[:error] = "Your review has been submitted!"
    else
      flash[:error] = "We're sorry, but your review could not be submitted."
    end
      redirect_to trips_path
  end

  def index
    @home = Home.find(params[:city])
    @city = @home.city
    @reviews = @home.reviews
  end

  private

  def params_check
    params.require(:review).permit(:thoughts, :title, :home_id, :user_id, :reservation_id)
  end
end
