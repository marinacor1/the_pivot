require 'rails_helper'

RSpec.feature "User can book any home" do
  scenario "when view a home show page" do
    user = create(:user)

    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit '/denver-co'

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    within(".date-picker-box") do
      # fill_in('.form-control', with: "07/23/2016 - 07/25/2016")
      # page.execute_script("$('#home-date-range').datepicker('startDate', '01/01/2010')")

      expect(page).to have_button("Reserve Dates")
      click_button "Reserve Dates"
    end

    expect(page).to have_text("Cart 1")
    # expect cart to increase by one / modal?
    expect(page).to have_content "Pack your bags! Your reservations are made!"
  end
end
