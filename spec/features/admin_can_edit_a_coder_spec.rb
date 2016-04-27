require 'rails_helper'

feature "When an admin visits the admin coder edit path" do
  scenario "they are able to edit the coder details" do
    user = create(:user)
    user.update(role: 1)
    coder = create(:coder)
    Category.create(name: "mobile")

    # Background: with an existing item
    # As an admin
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    within(".user-form") do
      click_on("Login")
    end
    # When I visit "admin/items"
    visit "/admin/coders/"
    # And I click "Edit"
    click_on("Edit Genius")
    # Then my current path should be "/admin/items/:ITEM_ID/edit"
    expect(current_path).to eq("/admin/coders/#{coder.id}/edit")
    # And I should be able to upate title, description, image, and status
    fill_in "Name", with: "new name"
    fill_in "Experience", with: "new experience"
    fill_in "coder[image_url]", with: "new image_url"
    fill_in "Cost", with: "22"
    fill_in "Category", with: "mobile"
    click_on "Update"

    expect(current_path).to eq("/coders/#{coder.id}")
    expect(page).to have_content("new name")
    expect(page).to have_content("new experience")
    expect(page).to have_selector("img[src$='new image_url']")
    expect(page).to have_content("22")
    expect(page).to have_content("mobile")
  end
end

# Background: with an existing item
# As an admin
# When I visit "admin/items"
# And I click "Edit"
# Then my current path should be "/admin/items/:ITEM_ID/edit"
# And I should be able to upate title, description, image, and status
