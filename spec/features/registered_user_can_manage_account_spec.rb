require 'rails_helper'
require 'features_helper'

feature "Registered user can manage account" do
  include FeaturesHelper
  scenario "when they click edit account on their dashboard" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "email@gmail.com", password: "password")
    original_first = user.first_name
    original_last = user.last_name

    user_login(user)

    expect(current_path).to eq(dashboard_path)

    click_link "Edit Account"

    expect(current_path).to eq("/users/#{user.id}/edit")

    within(".user-edit-page") do
      fill_in "First Name", with: "Leslie"
      fill_in "Last Name", with: "Smith"
      click_on "Update Account"
    end

    expect(page).to have_content "Success! Your account updated."
    expect(page).to have_content "Leslie"
    expect(page).not_to have_content original_first
    expect(page).not_to have_content original_last
  end

  scenario "if input is incorrect account will not update" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "email@gmail.com", password: "password")
    original_first = user.first_name
    original_last = user.last_name

    visit root_path

    user_login(user)

    expect(current_path).to eq(dashboard_path)

    click_link "Edit Account"

    expect(current_path).to eq("/users/#{user.id}/edit")

    within(".user-edit-page") do
      fill_in "First Name", with: ""
      fill_in "Last Name", with: ""
      click_on "Update Account"
    end

    expect(page).to have_content "Your account could not be updated. Please check your input and try again."
  end
end
