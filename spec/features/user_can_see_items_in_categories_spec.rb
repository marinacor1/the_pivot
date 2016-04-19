require 'rails_helper'

feature 'User can check categories' do
  scenario "when they visit item page" do
    created_items = create_list(:item, 4)
    created_categories = create_list(:category, 2)

    created_items[0].update(category_id: created_categories[0].id)
    created_items[1].update(category_id: created_categories[0].id)
    created_items[2].update(category_id: created_categories[1].id)
    created_items[3].update(category_id: created_categories[1].id)

    visit category_path(created_categories[0])

    expect(page).to have_content(created_items[0].name)
    expect(page).to have_content(created_items[1].name)

    visit category_path(created_categories[1])

    expect(page).to have_content(created_items[2].name)
    expect(page).to have_content(created_items[3].name)
  end
end
