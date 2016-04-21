class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_slug(params[:slug])
    respond_to do |format|
      format.html
      format.json { render json: @category}
    end
  end

end
