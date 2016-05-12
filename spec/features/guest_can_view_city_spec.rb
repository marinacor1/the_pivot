require 'rails_helper'

feature "Guest can view a specific city show page" do
  scenario "when they select a city from the main page dropdown" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    visit root_path

    click_on "All Cities"
    click_link city.name_and_state

    expect(current_path).to eq('/denver-co')

    within(".city-page") do
      expect(page).to have_content(city.name_and_state)
    end

    within(first(".home-thumb")) do
      expect(page).to have_content(home.title)
      expect(page).to have_content(home.address)
      expect(page).to have_content(home.daily_rate)
      expect(page).to have_content(home.description)
    end
  end
end
