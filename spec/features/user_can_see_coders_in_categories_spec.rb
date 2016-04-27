require 'rails_helper'

feature 'User can view coders' do
  scenario "when they visit category page" do
    coder1,coder2,coder3,coder4 = create_list(:coder, 4)
    category1,category2 = create_list(:category, 2)

    coder1.update(category_id: category1.id)
    coder2.update(category_id: category1.id)
    coder3.update(category_id: category2.id)
    coder4.update(category_id: category2.id)

    visit category_path(category1)

    expect(page).to have_content(coder1.name)
    expect(page).to have_content(coder2.name)

    visit category_path(category2)

    expect(page).to have_content(coder3.name)
    expect(page).to have_content(coder4.name)
  end

  scenario "when they visit empty category" do
    category = create(:category)

    visit category_path(category)
    expect(page).to have_content(category.name)
  end
end
