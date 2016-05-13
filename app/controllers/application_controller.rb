class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user
  before_action :authorize!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session["user_id"]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_permission
    @current_permission ||=  PermissionsService.new(current_user, params[:controller], params[:action])
  end

  def authorize!
    unless current_permission.allow?
      redirect_to root_url, danger: "You shall not pass!"
    end
  end

end
