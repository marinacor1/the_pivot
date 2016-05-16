require 'rails_helper'

RSpec.feature "User can add home to cart" do
  scenario "adds one home", js: true do
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
      expect(page).to have_link("Checkout")
    end

    within(".panel") do
      expect(page).to have_text(home.title)
      expect(page).to have_text(home.description)
      expect(page).to have_link("Delete")
    end
  end

  scenario "adds two homes", js: true do
    user = create(:user)
    city = create(:city_with_homes, name: "Denver", state: "CO")

    first_home = city.homes[0]
    second_home = city.homes[1]

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/denver-co'

    within('#cart-count') do
      expect(page).to have_text("0")
    end

    click_on first_home.title

    expect(current_path).to eq("/denver-co/homes/#{first_home.id}")

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
      expect(page).to have_link("Checkout")
    end

    within(".city-homes") do
      expect(page).to have_text(first_home.title)
      expect(page).to have_text(first_home.description)
      expect(page).to have_link("Delete")
    end

    visit '/denver-co'

    within('#cart-count') do
      expect(page).to have_text("1")
    end

    click_on second_home.title

    expect(current_path).to eq("/denver-co/homes/#{second_home.id}")

    within(".date-picker-box") do
      expect(page).to have_button("Request Dates")
      sleep(1)
      click_button "Request Dates"
    end

    within('#cart-count') do
      expect(page).to have_text("2")
    end

    visit '/cart'

    within('.page-header') do
      expect(page).to have_text("Your Cart")
      expect(page).to have_text("Trips: 2")
      expect(page).to have_link("Checkout")
    end

    within(".city-homes") do
      expect(page).to have_text(second_home.title)
      expect(page).to have_text(second_home.description)
    end

  end

end
