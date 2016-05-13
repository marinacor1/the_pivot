require 'rails_helper'

RSpec.feature "host can update home" do
  it "shows an update form for home" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user)
    home = city.homes.first
    original_home_name = home.title
    host_role = Role.create(name: "host")
    # r_u_role = Role.create(name: "registered_user")
    # UserRole.create(user: host, role: host_role)
    host.user_roles.create(role: host_role)
    home.user_id = host.id

    visit root_path

    click_link "Login"

    fill_in "Email:", with: "#{host.email}"
    fill_in "Password:", with: "password"
    click_link "Login"
save_and_open_page
    visit dashboard_path

    click_link "Manage Your Home"

    expect(current_path).to eq("/denver-co/homes/#{home.id}/edit")

    fill_in "Title:", with: "Stinky Outhouse"
    fill_in "City:", with: "San Francisco, CA"
    click_link "Submit"

    expect(page).to have_content "Stinky Outhouse"
    expect(page).to have_content "San Francisco, CA"
    expect(current_path).to eq("/denver-co/homes/#{home.id}")
  end

  xit "will not allow a non-host to update home" do

    visit dashboard_path

    expect(page).to_not have_content "Manage Your Home"

    expect(current_path).to eq("/denver-co/homes/#{home.id}/edit")

  end
end
