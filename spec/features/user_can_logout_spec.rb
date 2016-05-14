require 'rails_helper'

RSpec.feature "user can logout" do
  scenario "they logout after being logged in" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "Tim@gmail.com", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    within(".user-form") do
      click_on "Login"
    end

    expect(current_path).to eq dashboard_path

    click_on "Logout"

    expect(page).to have_content "Login"
    expect(current_path).to eq root_path
  end
end
