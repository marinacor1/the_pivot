class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_slug(params[:id])
  end

end
