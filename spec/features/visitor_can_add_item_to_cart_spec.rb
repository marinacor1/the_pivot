require 'rails_helper'

feature "Visitor can add item to cart" do
  scenario "when they click haggle button" do
    item = create(:item)

    visit items_path

    click_button "I'm interested"

    visit carts_path

    expect(current_path).to eq(carts_path)
    expect(page).to have_content(item.name)
    expect(page).to have_css("img[src=\"#{item.image_url}\"]")
    expect(page).to have_content(item.description)
    expect(page).to have_content("total deals: 1")
  end
end
