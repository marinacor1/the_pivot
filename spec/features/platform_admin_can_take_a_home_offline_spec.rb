require 'rails_helper'

RSpec.feature "host can update home" do
  it "shows an update form for home" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user, email: "macies@li.biz", password: "password")
    home = city.homes.first
    host.roles << Role.create(name: "host")
    home.users << host
    platform_admin = create(:user, email: "pa@admin.co", password: "password")
    platform_admin.roles << Role.create(name: "platform_admin")

    visit root_path

    click_link "Login"

    expect(current_path).to eq '/login'
    fill_in "email", with: "#{platform_admin.email}"
    fill_in "password", with: "password"
    click_button "Login"

    expect(current_path).to eq '/dashboard'

    click_link "Edit User Account or Homes"

    click_link "Edit User Home"

    uncheck("Online?")

    click_button "Submit"

    visit city_home_path(home.city, home)

    expect(page).to have_content "The page you were looking for doesn't exist."

    visit '/users'

    click_link "Edit User Home"

    check("Online?")

    click_button "Submit"

    visit city_home_path(home.city, home)

    expect(page).to have_content "#{home.title}"
    expect(page).to have_content "#{home.description}"
  end

  scenario "host cannot take a home offline" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user, email: "macies@li.biz", password: "password")
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

    click_link "Manage Your Home"

    expect(current_path).to eq("/denver-co/homes/#{home.id}/edit")

    expect(page).to_not have_content "Online?"
  end
end
