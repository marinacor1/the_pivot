require "rails_helper"

feature "User visits history" do
  scenario "sees all past history" do
    user1,user2 = create_list(:user, 2)

    visit login_path

    fill_in "Username", with: user1.username
    fill_in "Password", with: "password"

    click_button "Login"
    coder = create(:coder)
    visit coders_path

    click_button "Add Genius"

    visit teams_path
    click_link "Create Team"
    sleep(1)
    contract1 = Contract.first

    expect(page).to have_content("Contract ID: #{contract1.id}")
    expect(page).to have_content(contract1.created_at)

    click_link "Logout"

    visit login_path

    fill_in "Username", with: user2.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit coders_path

    click_button "Add Genius"

    visit teams_path

    click_link "Create Team"

    visit history_path

    contract2 = Contract.last

    expect(page).to_not have_content(contract1.created_at)

    expect(page).to have_content("Contract ID: #{contract2.id}")
    expect(page).to have_content(contract2.created_at)
  end
end
