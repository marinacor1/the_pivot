class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:action] = "You've successfully logged in"
      redirect_to root_path
    else
      flash[:action] = "login unsuccesful"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :organization, :password, :password_confirmation)
  end

end
