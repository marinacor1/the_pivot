require 'rails_helper'
require 'features_helper'

feature "Registered user can manage account" do
  include FeaturesHelper
  scenario "when they click edit account on their dashboard" do
    user = create(:user)
    original_first = user.first_name
    original_last = user.last_name

    user_login(user)

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
