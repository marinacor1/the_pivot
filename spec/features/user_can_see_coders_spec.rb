require 'rails_helper'

feature "User can see coders" do
  scenario "when they visit coders page" do
    coder = create(:coder)

    visit coders_path

    expect(page).to have_content(coder.name)
  end
end
