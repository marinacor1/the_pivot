require 'rails_helper'

feature "User can see items" do
  scenario "when they visit item page" do
    item = create(:item)

    visit items_path

    expect(page).to have_content(item.name)
  end
end
