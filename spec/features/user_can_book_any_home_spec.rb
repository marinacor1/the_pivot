require 'rails_helper'

RSpec.feature "User can book any home" do
  scenario "when view a home show page", js: true do
    user = create(:user)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit '/denver-co'

    within('#cart-count') do
      expect(page).to have_text("0")
    end

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    within(".date-picker-box") do
      expect(page).to have_button("Reserve Dates")
      sleep(1)
      click_button "Reserve Dates"
    end

    within('#lets-go') do
      sleep(1)
      click_on "Let's Go!"
      sleep(1)
    end

    within('#cart-count') do
      expect(page).to have_text("1")
    end
  end
end
