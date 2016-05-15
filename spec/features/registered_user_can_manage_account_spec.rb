require 'rails_helper'
require 'features_helper'

feature "Registered user can manage account" do
  include FeaturesHelper
  scenario "when they click edit account on their dashboard" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "email@gmail.com", password: "password")
    original_first = user.first_name
    original_last = user.last_name

    visit root_path

    click_on "Login"

    expect(current_path).to eq login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    within(".login-user-form") do
      click_on "Login"
    end

    expect(current_path).to eq(dashboard_path)

    click_link "Edit Account"

    expect(current_path).to eq("/users/#{user.id}/edit")

    within(".edit-form") do
      fill_in "First Name", with: "Leslie"
      fill_in "Last Name", with: "Smith"
      click_on "Update Account"
    end

    expect(page).to have_content "Success! Your account updated."
    expect(page).to have_content "Leslie"
    expect(page).not_to have_content original_first
    expect(page).not_to have_content original_last
  end
end
