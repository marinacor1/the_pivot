require 'rails_helper'

RSpec.feature "user can review spec" do
  scenario "user can see review on home show page" do
    user = create(:user)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first
    trip = Trip.new(user: user, created_at: "01-14-2016", updated_at: "01-16-2016" )
    reservation = Reservation.create(home_id: home.id, trip: trip, user_id: user.id, check_in: "01-14-2016", check_out: "01-16-2016")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/trips"

    within('.page-header') do
      expect(page).to have_text("My Trips")
    end

    within('.trips') do
      expect(page).to have_text(home.title)
    end
save_and_open_page
    click_on "Review this Trip"

    within('.review-popup') do
      fill_in "Review:", with: "This trip was amazing. Mary was a wonderful host and brought us tea and crumpets everyday. Super close to public transit as well."
      click_on "Submit"
    end

    visit "/denver-co/homes/#{home.id}"

    expect(page).to have_content "This trip was amazing. Mary was a wonderful host and brought us tea and crumpets everyday. Super close to public transit as well."
  end
end
