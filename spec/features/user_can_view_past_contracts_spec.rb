require 'rails_helper'

feature "User can see individual contract details" do
  before(:each) do
    @coder1, @coder2 = create_list(:coder, 2)
    user = create(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    visit coders_path
    @submissions = page.all('input[type="submit"]')
    @submissions[0].click
    @submissions[1].click
    visit teams_path
    click_link "Create Team"
    @contract = Contract.first
  end

  scenario "when they click link from history page" do
    formatted_date_created = @contract.created_at.strftime("%B %d, %Y - %H:%M")

    visit history_path

    expect(page).to have_content("Contract ID: #{@contract.id}")
    click_link "View"

    expect(page).to have_link(@coder1.name)
    expect(page).to have_link(@coder2.name)
    expect(page).to have_content(@coder1.cost)
    expect(page).to have_content(@coder2.cost)
    expect(page).to have_content("Contracted")
    total_cost = sprintf("%.2f", (@coder1.cost.to_f + @coder2.cost.to_f))
    expect(page).to have_content(total_cost)
    expect(page).to have_content(formatted_date_created)
    expect(page).to_not have_content("Completed at:")
    expect(page).to_not have_content("Cancelled at:")
  end

  scenario "when they click link from history page and a contract has been completed" do
    @contract.update(status: "Completed")
    formatted_date_updated = @contract.updated_at.strftime("%B %d, %Y - %H:%M")

    visit history_path
    click_link "View"

    expect(page).to have_content("Completed")
    expect(page).to have_content("Completed at:")
    expect(page).to have_content(formatted_date_updated)
  end

  scenario "when they click link from history page and a contract has been cancelled" do
    @contract.update(status: "Cancelled")
    formatted_date_updated = @contract.updated_at.strftime("%B %d, %Y - %H:%M")

    visit history_path
    click_link "View"

    expect(page).to have_content("Cancelled")
    expect(page).to have_content("Cancelled at:")
    expect(page).to have_content(formatted_date_updated)
  end

  scenario "when they click link from history page and a contract has been cancelled" do
    @contract.update(status: "Paid")

    visit history_path
    click_link "View"

    expect(page).to have_content("Paid")
  end
end
