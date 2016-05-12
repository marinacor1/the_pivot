require 'rails_helper'

feature "Registered user can manage account" do
  scenario "when they click edit account on their dashboard" do
    user = create(:user)
    email = user.email
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit dashboard_path

    click_link "Edit Account"

    expect(current_path).to eq("/#{user.id}/edit")

    within(".edit-form") do
      fill_in "Email", with: "newemail@crazy.com"
      fill_in "Enter Password", with: "password1"
      fill_in "Confirm Password", with: "password1"
      click_on "Update Account"
    end

    expect(page).to have_content "Welcome to Your Dashboard, #{user.username}"
    expect(page).to have_content "newemail@crazy.com"
    expect(page).not_to have_content email
  end
end
