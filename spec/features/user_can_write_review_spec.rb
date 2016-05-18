require 'rails_helper'
require 'features_helper'
RSpec.feature "user can review spec" do
  include FeaturesHelper
  scenario "user can see review on home show page" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "email@gmail.com", password: "password")
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    user_login(user)

    visit '/denver-co'

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

    click_on "Review this Trip"

    within('.review-popup') do
      fill_in "Review:", with: "This trip was amazing. Mary was a wonderful host and brought us tea and crumpets everyday. Super close to public transit as well."
      click_on "Submit"
    end

    visit "/denver-co/homes/#{home.id}"

    expect(page).to have_content "This trip was amazing. Mary was a wonderful host and brought us tea and crumpets everyday. Super close to public transit as well."
  end
end
