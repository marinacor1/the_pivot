require 'rails_helper'

RSpec.feature "guest can create account" do
  scenario "they click on create account to register" do
    visit root_path

    within(".nav") do
      click_on "Create Account"
    end

    expect(current_path).to eq new_user_path

    fill_in "First name", with: "Admir"
    fill_in "Last name", with: "Draganovic"
    fill_in "Email", with: "admir@gmail.com"
    fill_in "Password", with: "password"

    click_on "Submit"

    expect(User.all.last.first_name).to eq "Admir"
    expect(User.all.last.last_name).to eq "Draganovic"
    expect(User.all.last.email).to eq "admir@gmail.com"

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Admir"
  end
end
