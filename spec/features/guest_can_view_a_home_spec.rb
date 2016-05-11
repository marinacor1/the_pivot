require 'rails_helper'

feature "guest can view a home" do
  it "shows general home information as well selection for dates" do
    city = create(:city_with_homes)

    visit city_path(city.slug)
save_and_open_page

    click_on "#{city.homes.first.title}"

    expect(current_path).to eq(home_path(home.id))
    expect(page).to have_content "Charming Bungalow Studio"
    expect(page).to have_content "Daily Rate: $65"
    expect(page).to have_content "Beautiful home, walking distance to East Austin."
    expect(page).to have_content "Check in:"
    expect(page).to have_content "Check out:"
    expect(page).to have_css("img[src=\"#{home.image_url}\"]")
  end
end
