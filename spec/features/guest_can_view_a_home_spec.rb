require 'rails_helper'

feature "guest can view a home" do
  it "shows general home information as well selection for dates" do
    city = create(:city_with_homes)
    home = create(:home, city_id: city.id)

    visit city_path(city.slug)

    click_on "#{city.homes.first.title}"
    expect(current_path).to eq(city_home_path(city.slug, home.id))
    expect(page).to have_content "Charming Bungalow Studio"
    expect(page).to have_content "Daily Rate: $65"
    expect(page).to have_content "Beautiful home, walking distance to East Austin."
    expect(page).to have_content "Check in:"
    expect(page).to have_content "Check out:"
    expect(page).to have_css("img[src=\"#{home.image_url}\"]")
  end
end
