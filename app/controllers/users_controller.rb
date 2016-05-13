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
    #if the user is a host, we want the dashboard to have the link to edit their home
    #this might be a good option for namespacing, so that we don't have to check here
    #or we want to create a conditional here and then the user dashboards will have logic
    if host?
      @home = Home.find_by(user: current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
