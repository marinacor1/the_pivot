require 'rails_helper'
require 'features_helper'

RSpec.feature "user can logout" do
  include FeaturesHelper
  scenario "they logout after being logged in" do
    user = User.create(first_name: "Tim", last_name: "Allan", email: "Tim@gmail.com", password: "password")

    user_login(user)

    expect(current_path).to eq dashboard_path

    click_on "Logout"

    expect(page).to have_content "Login"
    expect(current_path).to eq root_path
  end
end
