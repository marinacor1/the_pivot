require 'rails_helper'

RSpec.feature "User can checkout" do
  scenario "when logged in with registered account", js: true do
    user = create(:user)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

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

    visit '/cart'

    within('#cart-count') do
      expect(page).to have_text("1")
    end

    within('.page-header') do
      expect(page).to have_text("Your Cart")
      expect(page).to have_text("Trips: 1")
      expect(page).to have_button("Checkout")
      click_button "Checkout"
    end

    expect(current_path).to eq("/trips")

    within('.page-header') do
      expect(page).to have_text("My Trips")
    end

    within('.trips') do
      expect(page).to have_text(home.title)
    end
  end
end
