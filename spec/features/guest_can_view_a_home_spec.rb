require 'rails_helper'

feature "guest can view a home" do
  xit "shows general home information as well selection for dates" do
    user = User.create(first_name: "Maribel", last_name: "Collins", email: "email@email.com",  password: "password", role: 1)
    city = City.create(name: "Austin", state: "Texas")
    home = Home.create(address: "1400 Wimetta Street", zipcode: "78719", title: "Charming Bungalow Studio", description: "Beautiful home, walking distance to East Austin.", day_rate: 65, image_url: "http://www.playhousenation.com/images/littlecottage/little-cottage-8x6-victorian-playhouse.jpg", city_id: 1, user_id: 1)

    visit '/Austin'
    click_on "Charming Bungalow Studio"

    expect(current_path).to eq(home_path(home))

    expect(page).to have_content "Charming Bungalow Studio"
    expect(page).to have_content "Daily Rate: $65"
    expect(page).to have_content "Beautiful home, walking distance to East Austin."
    expect(page).to have_content "Check in:"
    expect(page).to have_content "Check out:"
    expect(page).to have_css("img[src=\"#{home.image_url}\"]")
  end
end
