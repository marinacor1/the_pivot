require 'rails_helper'

feature "Guest can view a home" do
  scenario "shows general home information as well selection for dates" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    visit '/denver-co'

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    save_and_open_page
    expect(page).to have_content "Charming Bungalow Studio"
    expect(page).to have_content "Daily Rate: $65"
    expect(page).to have_content "Beautiful home, walking distance to East Austin."
    expect(page).to have_content "Check in:"
    expect(page).to have_content "Check out:"
    expect(page).to have_css("img[src=\"#{home.image_url}\"]")
  end
end
