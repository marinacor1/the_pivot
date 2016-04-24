require 'rails_helper'

feature "When an admin logs in" do
  scenario "cannot modify users" do
    user1, user2 = create_list(:user, 2)
    user1.update(role: 1)

    visit login_path
    fill_in "Username", with: user1.username
    fill_in "Password", with: user1.password
    within(".user-form") do
      click_on("Login")
    end

    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content('Admin Dashboard')

   click_link "Edit Profile"
    fill_in "Name", with: "Mrs. New Admin"
    fill_in "Username", with: "New Admin"
    fill_in "Email", with: "newemail@example.com"
    fill_in "Organization", with: "Girl Develop It"
    fill_in "Password", with: "Youdontknow"
    fill_in "user[password_confirmation]", with: "Youdontknow"

    click_button "Update Profile"

    expect(page).to have_content("Profile successfully updated.")

    click_on("Logout")
    click_on("Login")
    fill_in "Username", with: "New Admin"
    fill_in "Password", with: "Youdontknow"
    within(".user-form") do
      click_on("Login")
    end

    expect(page).to have_content("Admin Dashboard")
  end
end

