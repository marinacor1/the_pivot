require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password) }
  end

  scenario "it can check if host" do
    city = create(:city_with_homes, name: "Seattle", state: "WA")
    host = create(:user, email: "mail@email.com", password: "password")
    home = city.homes.first
    host_role = Role.create(name: "host")
    host.roles << host_role
    home.users << host

    expect(host.host?).to eq true
  end

  scenario "it can check if platform_admin" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user, email: "macies@li.biz", password: "password")
    home = city.homes.first
    original_home_name = home.title
    host.roles << Role.create(name: "host")
    home.users << host
    platform_admin = create(:user, email: "pa@admin.co", password: "password")
    platform_admin.roles << Role.create(name: "platform_admin")

    expect(platform_admin.platform_admin?).to eq true
  end

end
