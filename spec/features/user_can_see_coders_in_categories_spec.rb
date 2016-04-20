require 'rails_helper'

feature 'User can view coders' do
  scenario "when they visit category page" do
    created_coders = create_list(:coder, 4)
    created_categories = create_list(:category, 2)

    created_coders[0].update(category_id: created_categories[0].id)
    created_coders[1].update(category_id: created_categories[0].id)
    created_coders[2].update(category_id: created_categories[1].id)
    created_coders[3].update(category_id: created_categories[1].id)

    visit category_path(created_categories[0])


    expect(page).to have_content(created_coders[0].name)
    expect(page).to have_content(created_coders[1].name)

    visit category_path(created_categories[1])

    expect(page).to have_content(created_coders[2].name)
    expect(page).to have_content(created_coders[3].name)
  end
end
