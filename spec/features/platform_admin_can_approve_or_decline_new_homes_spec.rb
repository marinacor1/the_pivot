require 'rails_helper'
require 'features_helper'
RSpec.feature "platform admin can approve or decline new homes" do
  include FeaturesHelper
  scenario "platform admin can approve a new home" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "email@gmail.com", password: "password")
    city = City.create(name: "Los Angeles", state: "CA")
    platform_admin = create(:user, email: "pa@admin.co", password: "password")
    platform_admin.roles << Role.create(name: "platform_admin")

    user_login(user)

    expect(current_path).to eq dashboard_path

    click_on "Be a host today!"

    expect(current_path).to eq new_home_path

    fill_in "Title", with: "Tiny LA Home"
    fill_in "Description", with: "My house is beautiful."
    fill_in "Image Link", with: "https://s-media-cache-ak0.pinimg.com/736x/1e/c5/eb/1ec5eb28f7580c245d571fcb8be7560e.jpg"
    fill_in "Address", with: "123 Lane Street"
    fill_in "Zip Code", with: "80203"
    fill_in "Daily Rate", with: "$16"
    select('Los Angeles, CA')
    click_button "Submit"

    expect(current_path).to eq dashboard_path

    expect("Tiny LA Home").to eq Home.all.last.title
    expect("My house is beautiful.").to eq Home.all.last.description
    expect("https://s-media-cache-ak0.pinimg.com/736x/1e/c5/eb/1ec5eb28f7580c245d571fcb8be7560e.jpg").to eq Home.all.last.image_url
    expect("123 Lane Street").to eq Home.all.last.address
    expect("80203").to_s.to eq Home.all.last.zip_code
    expect("$16").to eq Home.all.last.daily_rate
    expect("Los Angeles").to eq Home.all.last.city.name

    expect(page).to have_content "Your request has been submitted for approval."

    click_link "Logout"

    expect(current_path).to eq root_path

    platform_admin_login(platform_admin)

    expect(current_path).to eq dashboard_path

    click_link "Pending Homes"
save_and_open_page
    check("Pending?")
    click_button "Submit"

    expect(current_path).to eq dashboard_path

    visit city_home_path(Home.all.last)

    expect(page).to have_content "Tiny LA Home"
    expect(page).to have_content "My House is beautiful."

  end

  xscenario "platform admin can decline a new home" do

  end
end
