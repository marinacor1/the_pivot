require 'rails_helper'
require 'features_helper'

RSpec.feature "host can update home" do
  include FeaturesHelper
  it "shows an update form for home" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user, email: "macies@li.biz", password: "password")
    home = city.homes.first
    original_home_name = home.title
    host.roles << Role.create(name: "host")
    home.users << host
    platform_admin = create(:user, email: "pa@admin.co", password: "password")
    platform_admin.roles << Role.create(name: "platform_admin")

    platform_admin_login(platform_admin)

    expect(current_path).to eq '/dashboard'

    click_link "Edit User Account or Homes"

    click_link "Edit User Home"

    expect(current_path).to eq("/denver-co/homes/#{home.id}/edit")

    within(".home-edit-page") do
      fill_in "Title", with: "Stinky Outhouse"
      fill_in "Description", with: "It's stinky. Very stinky."
      click_on "Submit"
    end

    expect(page).to have_content "Stinky Outhouse"
    expect(page).to have_content "It's stinky. Very stinky."
    expect(current_path).to eq("/denver-co/homes/#{home.id}")
  end

end
