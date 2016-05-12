class Seed
  def initialize
    generate_cities
    generate_homes
    generate_users
    generate_days
  end

  def generate_days
    60.times do |i|
      Day.create(date: Date.today + i)
    end
  end

  def generate_homes
    20.times do |i|
      home = Home.create!(address: Faker::Address.street_address,
                          image_url: "http://placekitten.com/30#{i}/25#{i}",
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
                          password: "password")
    end
  end

end

Seed.new
