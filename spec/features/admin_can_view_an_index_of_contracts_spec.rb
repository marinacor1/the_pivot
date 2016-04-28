require 'rails_helper'

feature "When an admin visits the index" do
  scenario "they see a list of orders" do
    user = create(:user)
    user.update(role: 1)
    coder1, coder2 = create_list(:coder, 2)
    coders_ids = [coder1.id, coder2.id]

    contract1 = Contract.create(user_id: user.id)
    contract2 = Contract.create(user_id: user.id)
    contract1.teammates.create(coder_id: coder1.id, cost: coder1.cost)
    contract2.teammates.create(coder_id: coder2.id, cost: coder2.cost)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    within(".user-form") do
      click_on("Login")
    end
    click_on "Contracts"

    expect(current_path).to eq('/admin/contracts')
    expect(page).to have_link(contract1.id)
    expect(page).to have_link(contract2.id)
    expect(page).to have_content(contract1.total_cost)
    expect(page).to have_content(contract2.total_cost)
  end
end
