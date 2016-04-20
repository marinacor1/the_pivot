require 'rails_helper'

feature 'User can remove an coder from their team'  do
  scenario 'coder is succesfully removed from team ' do
    coder1, coder2 = create_list(:coder, 2)

    visit coders_path

    submissions = page.all('input[type="submit"]')

    submissions[0].click
    submissions[1].click

    expect(page).to have_content("Your Team (2)")

    visit teams_path

    find("a[href='#{team_path(coder1.id)}']").click

    expect(current_path).to eq(teams_path)
  end
end
