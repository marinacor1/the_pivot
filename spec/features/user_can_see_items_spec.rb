require 'rails_helper'

feature "User can see items" do
  scenario "when they visit item page" do
    Item.create(name: "hat", image_url: "hat.png", description: "It's a red hat.")

    visit "/items"

    expect(page).to have_content("hat")
  end
end
