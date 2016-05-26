class ReviewsController < ApplicationController
  def new
    @review = Review.new
    #params: {"controller"=>"reviews", "action"=>"new"}
  end

  def create
    @review = Review.new(params_check)
    @home = Home.find(params[:review][:home_id])
    if @review.save
      @home.reviews << @review
      flash[:error] = "Your review has been submitted!"
    else
      flash[:error] = "We're sorry, but your review could not be submitted."
    end
      redirect_to trips_path
  end

  def index
    @home = Home.find(params[:city])
    @reviews = @home.reviews
  end

  private

  def params_check
    params.require(:review).permit(:thoughts, :title, :home_id, :user_id)
  end
end
