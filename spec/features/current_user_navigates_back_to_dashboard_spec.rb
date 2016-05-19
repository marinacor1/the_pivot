require 'rails_helper'

RSpec.feature 'current user can navigate back to dashboard' do
  scenario 'they are looking at trips and link back to dashboard' do
    city = create(:city_with_homes, name: "Seattle", state: "WA")
    host = create(:user, email: "mail@email.com", password: "password")
    home = city.homes.first
    host_role = Role.create(name: "host")
    host.roles << host_role
    home.users << host

    visit root_path

    click_link "Login"

    expect(current_path).to eq '/login'
    fill_in "email", with: "#{host.email}"
    fill_in "password", with: "password"
    click_button "Login"

    expect(current_path).to eq dashboard_path

    click_on "My Trips"

    expect(current_path).to eq trips_path

    click_on "My Dashboard"

    expect(current_path).to eq dashboard_path
  end
end
