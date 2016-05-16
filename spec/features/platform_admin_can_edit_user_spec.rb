require 'rails_helper'

RSpec.feature "platform admin can edit any user" do
  scenario "platform sees updated user after editing" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user)
    home = city.homes.first
    original_home_name = home.title
    host.roles << Role.create(name: "host")
    home.users << host
    platform_admin = create(:user, email: "pa@admin.co", password: "password")
    platform_admin.roles << Role.create(name: "platform_admin")
    user1 = create(:user)
    user2 = create(:user)

    visit '/users'
save_and_open_page
  end
end
