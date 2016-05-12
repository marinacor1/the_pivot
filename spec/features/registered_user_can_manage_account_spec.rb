require 'rails_helper'

feature "Registered user can manage account" do
  scenario "when they click edit account on their dashboard" do
    user = create(:user)
    original_first = user.first_name
    original_last = user.last_name
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit dashboard_path

    click_link "Edit Account"

    expect(current_path).to eq("/#{user.id}/edit")

    within(".edit-form") do
      fill_in "First Name", with: "Leslie"
      fill_in "Last Name", with: "Smith"
      click_on "Update Account"
    end

    expect(page).to have_content "Welcome to Your Dashboard, Leslie"
    expect(page).not_to have_content original_first
    expect(page).not_to have_content original_last
  end
end
