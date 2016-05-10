class Seed
  def initialize
    generate_cities
    generate_homes
    generate_users
    generate_dates
  end

  def generate_cities
    10.times do
      city = City.create!(name: Faker::Address.city,
                          state: Faker::Address.state_abbr)
    end
  end

  def generate_homes
    20.times do |i|
      home = Home.create!(address: Faker::Address.street_address,
                          image_url: "http://placekitten.com/648/#{i}",
                          zip_code: Faker::Address.zip_code,
                          title: Faker::Hipster.sentence(2),
                          description: Faker::Hipster.sentence,
                          daily_rate: 40.30)
    end
  end

  def generate_users

  end

  def generate_dates
    50.times do |i|
      Date.create(date: Faker::Date.forward(i))
    end
  end

end
