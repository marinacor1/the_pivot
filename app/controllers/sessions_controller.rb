class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:message] = "You have successfully logged in!"
      if session[:cart]
        redirect_to carts_path
      else
        redirect_to dashboard_path
      end
    else
      flash[:error] = "login unsuccessful"
      render :new
    end
  end
  # def create
  #   user = User.find_by(email: params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_path, success: "Welcome to Airbnbasement, #{user.name}"
  #   else
  #     flash.now[:danger] = "The username or password is invalid. Please try again."
  #     render :new
  #   end
  # end


  def destroy
    session.clear
    redirect_to root_path
  end
end
