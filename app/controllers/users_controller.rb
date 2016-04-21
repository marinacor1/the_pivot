class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Logged in as #{@user.name}"
      redirect_to dashboard_path
    else
      flash[:action] = "login unsuccesful"
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :organization, :password, :password_confirmation)
  end

end
