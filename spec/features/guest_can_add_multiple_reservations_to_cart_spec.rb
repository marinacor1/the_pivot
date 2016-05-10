require 'rails_helper'

RSpec.feature 'guest can add multiple reservations to cart' do
  xscenario 'they see total in cart after adding trips' do
    home1 = Home.create(address: "123 Fake Street", zip_code: "80002", title: "Adobe Mansion", description: "A basement with dirt walls.", image_url: "https://upload.wikimedia.org/wikipedia/commons/8/80/StoneBrick_Basement.JPG", cities_id: city1.id, user_id: user1.id)
    home2 = Home.create(address: "555 Street", zip_code: "80002", title: "Adobe Mansion", description: "A basement with dirt walls.", image_url: "https://upload.wikimedia.org/wikipedia/commons/8/80/StoneBrick_Basement.JPG", cities_id: city2.id, user_id: user2.id)

    city = City.create(name: "Austin", state: "Texas")

    visit home_path(home1)

    select_date Date.today, from: 'Checkin'
    select_date Date.next_today, from: 'Checkout'

    click_on "Add Reservation to Cart"

    within ".cart" do
      expect(css).to have_content("1")
    end

    expect(page).to have_content "You have added a trip to your cart!"

    click_link city.name

    expect(current_path).to eq city_path(city)

    click_link home2.title

    expect(current_path).to eq home_path(home2)

    select_date Date.today, from: 'Checkin'
    select_date Date.next_today, from: 'Checkout'

    click_on "Add Reservation to Cart"

    within ".cart" do
      expect(css).to have_content("2")
    end
  end
end
