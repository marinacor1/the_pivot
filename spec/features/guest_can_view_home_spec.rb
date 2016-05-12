require 'rails_helper'

feature "Guest can view a home" do
  scenario "shows general home information as well selection for dates" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    visit '/denver-co'

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    within(".page-header") do
      expect(page).to have_content home.title
    end
    
    within(".home") do
      expect(page).to have_content "#{home.daily_rate} per night"
      expect(page).to have_content home.description
      expect(page).to have_css("img[src=\"#{home.image_url}\"]")
    end
  end
end
