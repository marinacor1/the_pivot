require "rails_helper"

feature "User visits history" do
  scenario "sees all past history" do
    user = User.create(name: "hedy", username: "hedy", organization: "turing",
                email: "email@eamil.com", password: "password")

    visit login_path

    fill_in "Username", with: "hedy"
    fill_in "Password", with: "password"

    click_button "Login"

    coder = create(:coder)
    visit coders_path

    click_button "Add Genius"

    visit teams_path

    click_link "Create Team"

    visit history_path

    contract = Contract.first

    expect(page).to have_content(contract.id)
    expect(page).to have_content(contract.created_at)
  end
end
