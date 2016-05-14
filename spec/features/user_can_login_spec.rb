require 'rails_helper'

RSpec.feature "user can login" do
  scenario "they login from the root" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "Tim@gmail.com", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    within(".user-form") do
      click_on "Login"
    end
    expect(current_path).to eq root_path
  end
end
