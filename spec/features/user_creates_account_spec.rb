require 'rails_helper'
  feature "user can visit login page" do
    scenario "and use create account link" do
      visit root_path

      expect(page).to have_link("Login")
      click_link_or_button "Login"
      expect(current_path).to eq(login_path)

      expect(page).to have_link("Create Account")

      click_link_or_button "Create Account"

      expect(current_path).to eq(new_user_path)

      fill_in "Name", with: "Name"
      fill_in "Username", with: "UserName"
      fill_in "Email", with: "fake@fake.com"
      fill_in "Organization", with: "Organization"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_on "Create Account"

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Logged in as Name")
      expect(page).to_not have_content("Login")
      expect(page).to have_link("Logout")
      expect(page).to have_content("UserName")
      expect(page).to have_content("fake@fake.com")
      expect(page).to have_content("Organization")
    end

    scenario "fails if required fields not entered" do

      visit new_user_path

      fill_in "Name", with: "Name"
      fill_in "Username", with: "UserName"
      fill_in "Organization", with: "Organization"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_on "Create Account"
      expect(page).to have_content("login unsuccesful")
      expect(page).to have_content("Sign in below")
      expect(current_path).to eq(users_path)
    end
  end
