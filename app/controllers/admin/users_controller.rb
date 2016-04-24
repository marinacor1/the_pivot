class Admin::UsersController < Admin::BaseController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:message] = "Profile successfully updated."
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :organization, :password)
  end
end
