module FeaturesHelper

  def user_login(user)
    visit root_path

    click_on "Login"

    expect(current_path).to eq login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    within(".login-user-form") do
      click_on "Login"
    end
  end

  def host_login(host)
    click_link "Login"

    expect(current_path).to eq '/login'
    fill_in "email", with: "#{host.email}"
    fill_in "password", with: "password"

    click_button "Login"
  end

  def platform_admin_login(user)
    visit root_path

    click_link "Login"

    expect(current_path).to eq '/login'
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "password"
    click_button "Login"
  end

end
