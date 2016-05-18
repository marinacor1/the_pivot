class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.create(params_check)
  end

  private

  def params_check
    # params.require(:review).permit()
  end
end
