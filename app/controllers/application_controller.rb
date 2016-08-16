require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :null_session
  before_action :set_cart
  before_action :authorize!
  helper_method :current_user
  

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
      redirect_to root_url
    end
  end

end
