require 'rails_helper'

feature "Visitor can view a specific city show page" do
  scenario "when they select a city from the main page dropdown" do
    city = create(:city_with_homes)

    visit root_path

    click_on "All Cities"
    click_link "#{city.name_and_state}"

    expect(current_path).to eq(city_path(city.slug))

    within(".city-show-page-css") do
      expect(page).to have_content(city.name_and_state)
      expect(page).to have_content(city.homes.first.title)
    end

  end
end
