class Seed
  def initialize
    @num_users = 100
    @num_homes = 10
    @num_days  = 60

    generate_homes
    generate_cities
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
      reservation     = Reservation.create(home_id: rand(1..@num_homes))
      day             = Day.order("RANDOM()").first
      reservation_day = ReservationDay.create(day_id: day.id)
      reservation.reservation_days << reservation_day
    end
    puts "Done Creating Reservations"
  end

  def generate_homes
    puts "Creating Homes"
    @num_homes.times do |i|
      home = Home.create!(
        address:     Faker::Address.street_address,
        image_url:   "https://robohash.org/#{i}",
        zip_code:    Faker::Address.zip_code,
        title:       "Basement #{i}",
        description: Faker::Hipster.sentence,
        daily_rate:  40.99
        )
    end
    puts "Done Creating Homes"
  end

  def generate_cities
    puts "Creating Cities"
    10.times do |i|
      city = City.create!(
        name: Faker::Address.city,
        state: Faker::Address.state_abbr
        )
      homes = Home.find(i + 1)
      city.homes << homes
    end
    puts "Done Creating Cities"
  end

  def generate_users
    puts "Creating Users"
    @num_users.times do |i|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password"
        )
    end
    puts "Done Creating Users"
  end

end

Seed.new
