require 'rails_helper'

RSpec.feature 'host can add another host' do
  scenario 'they add another user with the role of host' do
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

    expect(current_path).to eq '/dashboard'

    click_on "Add Host"

    expect(current_path).to eq new_user_path

    fill_in "First name", with: "Admir"
    fill_in "Last name", with: "Draganovic"
    fill_in "Email", with: "admir@gmail.com"
    fill_in "Password", with: "password"

    click_on "Submit"

    expect(User.last.first_name).to eq "Admir"
    expect(User.last.roles.first.name).to eq "host"


  end
end
