require 'rails_helper'

feature "user can visit login page" do
  scenario "and login and back out" do
    User.create(name: "thom", username: "Thomp",
                password: "password", email: "email@email.com",)

    visit root_path

    click_link "Login"

    fill_in "Username", with: "Thomp"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(root_path)

    click_on "Logout"

    expect(page).to have_link("Login")
  end

  scenario "enters wrong information" do
    User.create(name: "thom", username: "Thomp",
                password: "password", email: "email",)

    visit root_path

    click_link "Login"

    fill_in "Username", with: "Thom"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to_not eq(root_path)
    expect(current_path).to eq(login_path)
  end
end
