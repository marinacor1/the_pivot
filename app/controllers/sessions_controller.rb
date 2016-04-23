class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:message] = "You have successfully logged in!"
      redirect_to root_path
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
