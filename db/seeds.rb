class Seed
  def initialize
    @num_users = 100
    @num_homes = 20
    @num_days  = 60

    generate_cities
    generate_homes
    generate_users
    generate_days
    generate_reservations
  end

  def generate_days
    puts "Creating Days"
    @num_days.times do |i|
      Day.create(date: Date.today + i)
    end
    puts "Done Creating Days"
  end

  def generate_reservations
    puts "Creating Reservations"
    10.times do
      reservation = Reservation.create(home_id: rand(1..@num_homes))
      days        = Day.order("RANDOM()").limit(7)
      reservation.days << days
    end
    puts "Done Creating Reservations"
  end

  def generate_homes
    puts "Creating Homes"
    @num_homes.times do |i|
      home = Home.create!(address: Faker::Address.street_address,
                          image_url: "http://placekitten.com/30#{i}/25#{i}",
                          zip_code: Faker::Address.zip_code,
                          title: Faker::Hipster.sentence(2),
                          description: Faker::Hipster.sentence,
                          daily_rate: 40.30)
    end
    puts "Done Creating Homes"
  end

  def generate_cities
    puts "Creating Cities"
    10.times do
      city = City.create!(name: Faker::Address.city,
                          state: Faker::Address.state_abbr)
      home = Home.order("RANDOM()").limit(2)
      city.homes << home
    end
    puts "Done Creating Cities"
  end

  def generate_users
    puts "Creating Users"
    @num_users.times do |i|
      user = User.create!(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          email: Faker::Internet.email,
                          password: "password")
    end
    puts "Done Creating Users"
  end

end

Seed.new
