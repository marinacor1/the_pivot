module FeaturesHelper

  def book_a_home(city, home)
    visit '/denver-co'

    click_on home.title

    expect(current_path).to eq("/denver-co/homes/#{home.id}")

    select("January 4, 2017 through January 6, 2017") #don't know how to do this

    click_link ("Book Now")
  end

  def book_another_home(city, home)
    visit '/austin-tx'

    click_on home2.title

    expect(current_path).to eq("/austin-tx/homes/#{home.id}")

    select("January 8, 2017 through January 12, 2017") #don't know how to do this

    click_link ("Book Now")
    end

  def user_login(user)
    visit root_path

    click_link "Login"
    save_and_open_page

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_link "Log In"
  end

end
