class ReviewsController < ApplicationController
  def new
    @review = Review.new
    #TODO you can do this: x = Review.new(home_id: "2", user_id: "3")
    #what I need to do is find a way to pass home_id and user_id into params
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
    #{"controller"=>"reviews", "action"=>"index", "city"=>"1", "id"=>"#<Review::ActiveRecord_Associations_CollectionProxy:0x007fe60daa5cd0>"}
    #TODO remove active record association for id
    @city = City.find(params[:city])
    @home = Home.find(params[:city])
    @reviews = @home.reviews
  end

  private

  def params_check
    params.require(:review).permit(:thoughts, :title, :home_id, :user_id, :reservation_id)
  end
end
