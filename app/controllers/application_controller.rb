class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_team, :nav_categories

  def set_team
    @team = Team.new(session[:team])
  end

  def nav_categories
    @nav_categories = Category.all
  end
end
