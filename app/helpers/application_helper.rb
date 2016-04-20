module ApplicationHelper

  def login_logout
    if current_user
      link_to "Logout", logout_path, method: :delete
    else

      link_to "Login", login_path
    end
  end

end
