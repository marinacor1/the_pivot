require 'rails_helper'

feature 'Guest is unable to checkout without registering' do
  scenario 'must create a user account' do
    user1, user2 = create_list(:user, 2)

    visit users_path

    submissions = page.all('input[type="submit"]')

    submissions[0].click
    submissions[1].click

    visit teams_path

    expect(page).to_not have_link("Create Team")

    within("div.book") do
      click_link("Create Account")
    end

    expect(current_path).to eq(new_user_path)
  end

 scenario "must login to user account" do
     user1, user2 = create_list(:user, 2)
    city = create(:city_with_homes, name: "Denver", state: "CO")
    home = city.homes.first

    visit '/denver-co'

    click_on home.title

    select("January 4, 2017") ("January 6, 2017") #don't know how to do this

    expect(page).to_not have_link("Book Now")

    within("div.book") do
      click_link("Login")
    end

    expect(current_path).to eq(login_path)
  end
end
