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
      link_to "History", history_path, class: "link"
    else
      link_to "Create Account", new_user_path, class: "link"
    end
  end

  def team_page_login
    if @team.contents == {}
      "Please add coders to check out."
    elsif current_user
      link_to 'Create Team', contracts_path, method: :post
    else
      "#{link_to('Login', login_path)} or #{link_to('Create Account', new_user_path)} to create your dream team".html_safe
    end
  end
end
