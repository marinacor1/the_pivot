require 'rails_helper'

RSpec.feature "User can remove booking from cart" do
  scenario "when viewing the cart", js: true do
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

    within('#cart-count') do
      expect(page).to have_text("1")
    end

    visit '/cart'

    within('#cart-count') do
      expect(page).to have_text("1")
    end

    within('.page-header') do
      expect(page).to have_text("Your Cart")
      expect(page).to have_text("Trips: 1")
      expect(page).to have_button("Checkout")
    end

    within(".panel") do
      expect(page).to have_text(home.title)
      expect(page).to have_text(home.description)
      expect(page).to have_link("Delete")
      click_link "Delete"
    end

    expect(current_path).to eq("/cart")

    within('.page-header') do
      expect(page).to have_text("Your Cart")
      expect(page).to have_text("Trips: 0")
      expect(page).to_not have_button("Checkout")
    end
  end
end
