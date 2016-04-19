require 'rails_helper'

feature "User can see items" do
  scenario "when they visit item page" do
    created_items = create_list(:item, 2)
    created_categories = create_list(:category, 1)
    require "pry"; binding.pry


    expect(page).to have_content("hat")
  end
end
