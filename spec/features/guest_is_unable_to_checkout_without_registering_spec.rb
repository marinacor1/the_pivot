require 'rails_helper'

feature 'Guest is unable to checkout without registering' do
  scenario 'must create a user account', js: true do
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
      click_link "Checkout"
    end

    expect(current_path).to eq(login_path)

    within(".create-account-link") do
      click_link "Create Account"
    end

    within(".create-account-page") do
      fill_in "First Name", with: "New"
      fill_in "Last Name", with: "User"
      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "password"
      click_on "Submit"
    end

    visit '/cart'

    within(".page-header") do
      expect(page).to_not have_link("Login or Create a New Account")
      expect(page).to have_button("Checkout")
    end
  end
end
