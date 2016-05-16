require 'rails_helper'

feature 'Guest is unable to checkout without logging in' do
  scenario 'must create a user account', js: true do
    user = create(:user)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    visit '/denver-co'

    within('#cart-count') do
      expect(page).to have_text("0")
    end

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    within(".date-picker-box") do
      expect(page).to have_button("Request Dates")
      sleep(1)
      click_button "Request Dates"
    end

    within('#cart-count') do
      expect(page).to have_text("1")
    end

    visit '/cart'

    within(".panel") do
      expect(page).to have_text(home.title)
      expect(page).to have_text(home.description)
      expect(page).to have_link("Delete")
    end

    within(".page-header") do
      expect(page).to_not have_button("Checkout")
      expect(page).to have_link("Login or Create a New Account")
      click_link("Login or Create a New Account")
    end

    expect(current_path).to eq(login_path)

    within(".login-user-form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_button "Login"
    end

    expect(current_path).to eq(cart_path)

    within(".page-header") do
      expect(page).to_not have_link("Login or Create a New Account")
      expect(page).to have_button("Checkout")
    end
  end
end
