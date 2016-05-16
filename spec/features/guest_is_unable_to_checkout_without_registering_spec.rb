require 'rails_helper'

feature 'Guest is unable to checkout without registering' do
  scenario 'must create a user account' do
    user = create(:user)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    visit '/denver-co'

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
      expect(page).to_not have_link("Checkout")
      expect(page).to have_link("Login or Create a New Account")
      click_link("Login or Create a New Account")
    end

    expect(current_path).to eq(login_path)

    within(".new-form") do
      fill_in "First Name", with: "Woody"
      fill_in "Last Name",  with: "Allen"
      fill_in "Email",      with: "wood@allen.com"
      click_on "Create Account"
    end

    expect(current_path).to eq("/cart")

    within(".page-header") do
      expect(page).to_not have_link("Login or Create a New Account")
      expect(page).to have_link("Checkout")
      click_link("Checkout")
    end
  end
end
