class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:message] = "You have successfully logged in!"
      @user.roles << Role.create(name:"registered_user")
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

  def destroy
    session.clear
    redirect_to root_path
  end
end
