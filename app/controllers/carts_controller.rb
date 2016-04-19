class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @items = Item.find(@cart.contents.keys)
  end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to items_path
  end

end
