class Admin::UsersController < Admin::BaseController
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
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
