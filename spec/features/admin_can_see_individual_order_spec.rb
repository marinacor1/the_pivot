require 'rails_helper'

feature "When an admin visits an individual order" do
  scenario "they are able to see order details" do
    # As an authenticated Admin,
    user = create(:user)
    user.update(role: 1)
    coder1, coder2 = create_list(:coder, 2)
    coders_ids = [coder1.id, coder2.id]
    contract = Contract.create(teammates_ids: coders_ids, user_id: user.id)
    formatted_date_created = contract.created_at.strftime("%B %d, %Y - %H:%M")

    # when I visit an individual order page
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    within(".user-form") do
      click_on("Login")
    end
    visit "/admin/contracts/#{contract.id}"

    # Then I can see the order's date and time.
    expect(page).to have_content(formatted_date_created)
    # And I can see the purchaser's full name and address.
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)

    save_and_open_page
    # And I can see, for each item on the order:
    #
    # The item's name, which is linked to the item page.
    expect(page).to have_link(coder1.name)
    expect(page).to have_link(coder2.name)
    # Line item subtotal. And I can see the total for the order.
    expect(page).to have_content(coder1.cost)
    expect(page).to have_content(coder2.cost)
    # Price
    total_cost = sprintf("%.2f", (coder1.cost.to_f + coder2.cost.to_f))
    expect(page).to have_content(total_cost)
    # And I can see the status for the order.
    expect(page).to have_content(contract.status)
  end
end
