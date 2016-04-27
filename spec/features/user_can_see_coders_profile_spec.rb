require 'rails_helper'

feature "User can see individual coder page" do
  scenario "successfully" do
    coder = create(:coder)

    visit coder_path(coder.id)

    expect(page).to have_content(coder.name)

    expect(page).to have_button('Add Genius')
  end

end
