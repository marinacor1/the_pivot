class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    @reservations = @cart.reservations
  end

end
