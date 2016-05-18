require 'rails_helper'
require 'features_helper'

RSpec.feature "user can review spec" do
  include FeaturesHelper
  scenario "user can see review on home show page" do
    user = create(:user, first_name: "Marina")

    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first
    trip = Trip.new(user: user, created_at: "01-14-2016", updated_at: "01-16-2016" )
    reservation = Reservation.create(home_id: home.id, trip: trip, user_id: user.id, check_in: "01-14-2016", check_out: "01-16-2016")

    user_login(user)

    visit "/trips"

    within('.page-header') do
      expect(page).to have_text("My Trips")
    end

    within('.trips') do
      expect(page).to have_text(home.title)
    end

    click_on "Review this Trip"

    expect(current_path).to eq new_review_path

    fill_in "Title:", with: "Peaceful retreat."
    fill_in "Thoughts:", with: "This trip was amazing. Mary was a wonderful host and brought us tea and crumpets everyday. Super close to public transit as well."
    click_on "Submit"

    visit "/denver-co/homes/#{home.id}"

    expect(page).to have_content "This trip was amazing. Mary was a wonderful host and brought us tea and crumpets everyday. Super close to public transit as well."
  end
end
