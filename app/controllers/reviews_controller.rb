class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.create(params_check)
    # if @review.save
    #   @review.home_id =
  end

  private

  def params_check
    params.require(:review).permit(:thoughts, :title)
  end
end
