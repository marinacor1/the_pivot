require 'rails_helper'

feature "When an admin logs in" do
  scenario "they are redirected to the admin/dashboard page" do
    # As an admin
    user = create(:user)
    user.update(role: 1)

    # when I login
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    within(".user-form") do
      click_on("Login")
    end

    # then I am redirected to '/admin/dashboard'
    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content('Admin Dashboard')
  end
end
