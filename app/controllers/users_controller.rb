class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Logged in as #{@user.first_name}"
      redirect_to dashboard_path
    else
      flash[:action] = "login unsuccesful"
      render :new
    end
  end

  def show
    if current_user.host? # => current_user.host?
      @home = Home.find_by(user: current_user)
    end
    @home = current_user.home
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
