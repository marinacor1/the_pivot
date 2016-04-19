require 'rails_helper'

feature "User can see coders" do
  scenario "when they visit homepage" do
    coder = create(:coder)

    visit root_path

    expect(page).to have_content(coder.name)
  end
end
