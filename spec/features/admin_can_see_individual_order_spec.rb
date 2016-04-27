require 'rails_helper'

feature "When an admin visits an individual order" do
  scenario "they are able to see order details" do
    user = create(:user)
    user.update(role: 1)
    coder1, coder2 = create_list(:coder, 2)
    coders_ids = [coder1.id, coder2.id]
    contract = Contract.create(teammates_ids: coders_ids, user_id: user.id)
    formatted_date_created = contract.created_at.strftime("%B %d, %Y - %H:%M")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    within(".user-form") do
      click_on("Login")
    end
    visit "/admin/contracts/#{contract.id}"

    expect(page).to have_content(formatted_date_created)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to have_link(coder1.name)
    expect(page).to have_link(coder2.name)
    expect(page).to have_content(coder1.cost)
    expect(page).to have_content(coder2.cost)
    total_cost = sprintf("%.2f", (coder1.cost.to_f + coder2.cost.to_f))
    expect(page).to have_content(total_cost)
    expect(page).to have_content(contract.status)
  end
end
