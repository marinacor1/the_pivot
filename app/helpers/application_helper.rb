module ApplicationHelper

  def login_logout
    if current_user
      link_to "Logout", logout_path, method: :delete, class: "link"
    else
      link_to "Login", login_path, class: "link"
    end
  end

  def history_create_account
    if current_user
      link_to "My Trips", trips_path, class: "link"
    else
      link_to "Create Account", new_user_path, class: "link"
    end
  end

  def current_dashboard
    if current_user
      link_to "My Dashboard", dashboard_path, class: "link"
    end
  end

end
