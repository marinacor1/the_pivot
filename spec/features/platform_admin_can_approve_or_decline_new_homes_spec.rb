require 'rails_helper'
require 'features_helper'
RSpec.feature "platform admin can approve or decline new homes" do
  include FeaturesHelper
  scenario "platform admin can approve a new home" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "email@gmail.com", password: "password")
    city = City.create(name: "Los Angeles", state: "LA")
    platform_admin = create(:user, email: "pa@admin.co", password: "password")
    platform_admin.roles << Role.create(name: "platform_admin")

    user_login(user)

    expect(current_path).to eq dashboard_path

    click_on "Be a host today!"

    expect(current_path).to eq new_home_path

    fill_in "Title", with: "Tiny LA Home"
    fill_in "Description", with: "My house is beautiful."
    fill_in "Url Link", with: "https://s-media-cache-ak0.pinimg.com/736x/1e/c5/eb/1ec5eb28f7580c245d571fcb8be7560e.jpg"
    fill_in "Address", with: "123 Lane Street"
    fill_in "Zipcode", with: "80203"
    fill_in "Daily Rate", with: "$16"
    select('Los Angeles', :from => 'City')
    click_button "Create Your Home"

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Your request has been submitted for approval."

    click_link "Logout"

    expect(current_path).to eq root_path

    platform_admin_login(platform_admin)

    expect(current_path).to eq dashboard_path

    click_link "Pending Homes"

    check("Approve?")

    visit city_home_path(Home.all.last)

    expect(page).to have_content "Tiny LA Home"
    expect(page).to have_content "My House is beautiful."

  end

  xscenario "platform admin can decline a new home" do

  end
end
