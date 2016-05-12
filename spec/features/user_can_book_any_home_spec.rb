require 'rails_helper'

RSpec.feature "User can book any home" do
  scenario "when view a home show page" do
    user = create(:user)

    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/denver-co'

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    select("January 4, 2017 through January 6, 2017") #don't know how to do this

    expect(page).to_not have_link("Book Now")

    expect(page).to have_content "Pack your bags! Your reservations are made!"
    #expect cart to increase by one
  end
end
