require 'rails_helper'
require 'features_helper'

RSpec.feature "host can update home" do
  include FeaturesHelper
  it "shows an update form for home" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user, email: "macies@li.biz", password: "password")
    home = city.homes.first
    host_role = Role.create(name: "host")
    host.roles << host_role
    home.users << host

    host_login(host)

    expect(current_path).to eq '/dashboard'

    click_link "Manage Your Home"

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

  it "will not allow a non-host to update home" do

    visit dashboard_path

    expect(page).to_not have_content "Manage Your Home"
  end

end
