class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:message] = "You have successfully logged in!"
      if current_admin?
        redirect_to admin_dashboard_path
      elsif session[:cart]
        redirect_to cart_path
      else
        redirect_to root_path
      end
    else
      flash[:error] = "login unsuccessful"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
