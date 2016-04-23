require 'rails_helper'

feature "When a visitor with a team logs in" do
  scenario "they are redirected to their team" do
    coder = create(:coder)
    user  = create(:user)

    visit coders_path
    click_button "Add Genius"
    visit teams_path
    within(".create-team") do
      click_link "Login"
    end
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"

    expect(current_path).to eq(teams_path)

    click_link "Create Team"
    contract1 = Contract.first

    expect(current_path).to eq('/history')
    expect(page).to have_content("Team successfully created.")
    expect(page).to have_content("Order 1")
    expect(page).to have_content(contract1.created_at)
  end
end
