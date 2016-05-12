require 'rails_helper'

feature 'Guest is unable to checkout without registering' do
  scenario 'must create a user account' do
    coder1, coder2 = create_list(:coder, 2)

    visit coders_path

    submissions = page.all('input[type="submit"]')

    submissions[0].click
    submissions[1].click

    visit teams_path

    expect(page).to_not have_link("Create Team")

    within("div.create-team") do
      click_link("Create Account")
    end

    expect(current_path).to eq(new_user_path)
  end

 scenario "must login to user account" do
     coder1, coder2 = create_list(:coder, 2)

    visit coders_path

    submissions = page.all('input[type="submit"]')

    submissions[0].click
    submissions[1].click

    visit teams_path

    expect(page).to_not have_link("Create Team")

    within("div.create-team") do
      click_link("Login")
    end

    expect(current_path).to eq(login_path)
  end
end
