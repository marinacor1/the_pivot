require 'rails_helper'

feature "When an admin visits the admin coder edit path" do
  scenario "they are able to edit the coder details" do
    user = create(:user)
    user.update(role: 1)
    category1 = Category.create(name: "mobile")
    category2 = Category.create(name: "data science")
    coder = create(:coder, category: category1)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    within(".user-form") do
      click_on("Login")
    end

    visit "/admin/coders/"

    click_on("Edit Genius")
    expect(current_path).to eq("/admin/coders/#{coder.id}/edit")
    fill_in "Name", with: "new name"
    fill_in "Experience", with: "new experience"
    fill_in "coder[image_url]", with: "new image_url"
    fill_in "Cost", with: "22"
    page.find_by_id("coder_category_id").
         find("option[value='#{category2.id}']").select_option
    click_on "Update"

    expect(current_path).to eq("/coders/#{coder.id}")
    expect(page).to have_content("new name")
    expect(page).to have_content("new experience")
    expect(page).to have_selector("img[src$='new image_url']")
    expect(page).to have_content("22")
    expect(page).to have_content(category2.name)
  end
end
