require 'rails_helper'

feature "Visitor can view a specific city show page" do
  scenario "when they select a city from the main page dropdown" do
    byebug
    city = create(:city_with_homes)

    visit root_path

    select("#{city.name_and_state}", from: "#{css-dropdown-name}")

    expect(current_path).to eq(city_path(city.id))

    within(".city-show-page-css") do
      expect(page).to have_content(city.name_and_state)
      expect(page).to have_css("img[src=\"#{city.image_url}\"]")
      expect(page).to have_content(city.homes.first)
    end

  end
end
