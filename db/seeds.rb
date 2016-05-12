class Seed
  def initialize
    generate_cities
    generate_homes
    generate_users
    generate_dates
  end

  def generate_dates
    50.times do |i|
      Date.create(date: Faker::Date.forward(i))
    end
  end

  def generate_homes
    20.times do |i|
      home = Home.create!(address: Faker::Address.street_address,
                          image_url: "http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2015/09/Bamboo-Home-Bali-Airbnb-Off-Grid-537x358.jpg",
                          zip_code: Faker::Address.zip_code,
                          title: Faker::Hipster.sentence(2),
                          description: Faker::Hipster.sentence,
                          daily_rate: 40.30)
    end
  end

  def generate_cities
    10.times do
      city = City.create!(name: Faker::Address.city,
                          state: Faker::Address.state_abbr)
        home = Home.order("RANDOM()").limit(2)
        city.homes << home
    end
  end

  def generate_users
    100.times do |i|
      user = User.create!(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          email: Faker::Internet.email,
                          password: "password",
                          role: rand(0..2))
    end
  end

end

Seed.new
