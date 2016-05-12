require 'rails_helper'

feature "User can see individual past trips details" do
  scenario "when they click link from history page" do
    user = create(:user)
    email = user.email

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    user1, user2 = create_list(:user, 2)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first
    city2 = create(:city_with_homes, name: "Austin", state: "TX")
    home2 = city.homes.first

    visit '/denver-co'

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    select("January 4, 2017") ("January 6, 2017") #don't know how to do this

    click_link ("Book Now")

    visit '/austin-tx'

    click_on home2.title

    expect(current_path).to eq("/austin-tx/homes/#{home.id}")

    select("January 8, 2017") ("January 12, 2017") #don't know how to do this

    click_link ("Book Now")
  end 
end
