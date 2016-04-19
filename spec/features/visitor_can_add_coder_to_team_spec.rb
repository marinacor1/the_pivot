require 'rails_helper'

feature "Visitor can add coder to cart" do
  scenario "when they click genius button" do
    coder = create(:coder)

    visit coders_path

    click_button "Add Genius"

    visit teams_path

    expect(current_path).to eq(teams_path)
    expect(page).to have_content(coder.name)
    expect(page).to have_css("img[src=\"#{coder.image_url}\"]")
    expect(page).to have_content(coder.experience)
    expect(page).to have_content("team size: 1")
  end
end
