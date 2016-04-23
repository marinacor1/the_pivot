class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_team, :nav_categories
  helper_method :current_user

  def set_team
    @team = Team.new(session[:team])
  end

  def nav_categories
    @nav_categories = Category.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end


