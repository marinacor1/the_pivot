require 'rails_helper'

RSpec.feature 'host can delete another host' do
  scenario 'they delete the other host from hosts page' do
    city = create(:city_with_homes, name: "Seattle", state: "WA")

    host1 = User.create(first_name: "1f-name", last_name: "1l-name", email: "host1@email.com", password: "password")
    home = city.homes.first
    host_role = Role.create(name: "host")
    host1.roles << host_role
    home.users << host1

    host2 = User.create(first_name: "2f-name", last_name: "2l-name", email: "host2@email.com", password: "password")
    home = city.homes.first
    host_role = Role.create(name: "host")
    host2.roles << host_role
    home.users << host2

    host3 = User.create(first_name: "3f-name", last_name: "3l-name", email: "host3@email.com", password: "password")
    home = city.homes.first
    host_role = Role.create(name: "host")
    host3.roles << host_role
    home.users << host3

    host_login(host1)
    
    expect(current_path).to eq '/dashboard'

    within(".all-hosts") do
      expect(page).to_not have_content "1f-name"
      expect(page).to have_content "2f-name"
      expect(page).to have_content "3f-name"
    end

    click_on "Delete 2f-name"

    within(".all-hosts") do
      expect(page).to_not have_content "1f-name"
      expect(page).to_not have_content "2f-name"
      expect(page).to have_content "3f-name"
    end
  end
end
