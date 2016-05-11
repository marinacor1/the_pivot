require 'rails_helper'

feature "Visitor can view a specific city show page" do
  scenario "when they select a city from the main page dropdown" do
    city = create(:city_with_homes)
    home = city.homes.first

    visit root_path

    click_on "All Cities"
    click_link "#{city.name_and_state}"

    expect(current_path).to eq(city_path(city.slug))

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
