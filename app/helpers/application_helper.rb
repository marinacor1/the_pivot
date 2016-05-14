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
      link_to "Past Trips", root_path, class: "link"
    else
      link_to "Create Account", new_user_path , class: "link"
    end
  end

end 
