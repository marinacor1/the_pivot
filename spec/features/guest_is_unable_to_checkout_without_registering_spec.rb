require 'rails_helper'

feature 'Guest is unable to checkout without registering' do
  xscenario 'must create a user account' do
    user = create(:user)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    visit '/denver-co'

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    select("January 4, 2017 through January 6, 2017") #don't know how to do this

    expect(page).to_not have_link("Book Now")

    within("div.book") do
      click_link("Login or Create a New Account")
    end

      expect(current_path).to eq(login_path)

      within(".new-form") do
        fill_in "First Name", with: "Woody"
        fill_in "Last Name", with: "Allen"
        fill_in "Email", with: "wood@allen.com"
        click_on "Create Account"
      end

      expect(current_path).to eq("/denver-co/homes/#{home.id}")
      expect(page).to have_content "Book Now"
    end

end
