require 'rails_helper'
require 'features_helper'

RSpec.feature 'host can add another host' do
  include FeaturesHelper
  scenario 'they add another user with the role of host' do
    city = create(:city_with_homes, name: "Seattle", state: "WA")
    host = create(:user, email: "mail@email.com", password: "password")
    home = city.homes.first
    host_role = Role.create(name: "host")
    host.roles << host_role
    home.users << host

    host_login(host)

    expect(current_path).to eq '/dashboard'

    click_on "Add Host"

    expect(current_path).to eq new_user_path

      fill_in "First Name", with: "Admir"
      fill_in "Last Name", with: "Draganovic"
      fill_in "Email", with: "admir@gmail.com"
      fill_in "Password", with: "password"

    click_on "Submit"

    expect(User.last.first_name).to eq "Admir"
    expect(User.last.roles.first.name).to eq "host"


  end
end
