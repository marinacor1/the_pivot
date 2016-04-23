require 'rails_helper'

feature "When a user views a retired coder" do
  scenario "they cannot add them to their team" do
    category = Category.create(name: "mobile")
    coder = create(:coder)
    coder.update(category_id: category.id)
    coder.update_attributes(active: false)

    visit coder_path(coder)

    expect(current_path).to eq(coder_path(coder))
    expect(page).to_not have_button("Add Genius")
    expect(page).to have_content("Coder in NSA Custody or Russian Gulag")

    visit coders_path
    expect(page).to_not have_content(coder.name)
    visit category_path(category.slug)
    expect(page).to_not have_content(coder.name)
  end
end
