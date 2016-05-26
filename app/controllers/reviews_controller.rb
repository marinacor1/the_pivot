class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_check)
    if @review.save
      flash[:error] = "Your review has been submitted!"
    else
      flash[:error] = "We're sorry, but your review could not be submitted."
    end
      redirect_to dashboard_path
  end

  private

  def params_check
    params.require(:review).permit(:thoughts, :title)
  end
end
