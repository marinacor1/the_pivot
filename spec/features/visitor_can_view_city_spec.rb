require 'rails_helper'

feature "Visitor can view a specific city show page" do
  scenario "when they select a city from the main page dropdown" do
    city = City.create(name: "San Antonio", state: "TX")
    home = Home.create(
      address: "123 Fake Street",
      zip_code: "80002",
      title: "Adobe Mansion",
      description: "A basement with dirt walls.",
      daily_rate: 50.00,
      image_url: "https://upload.wikimedia.org/wikipedia/commons/8/80/StoneBrick_Basement.JPG",
      city_id: city.id
    )

    visit root_path

    click_on "All Cities"
    click_link "San Antonio, TX"

    expect(current_path).to eq(city_path(city.slug))

    within(".city-show-page-css") do
      expect(page).to have_content(city.name_and_state)
      expect(page).to have_content(city.homes.first.title)
    end

  end
end
