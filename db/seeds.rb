class Seed
  def initialize
    @num_users = 100
    @num_homes = 10
    @num_days  = 60
    @num_hosts = @num_homes

    generate_roles
    generate_hosts_and_homes
    generate_cities
    generate_users
    generate_platform_admin
    generate_specific_users
    generate_days
    generate_reservations
  end

  def generate_roles
    puts "Creating Roles"
    Role.create(name: "host")
    Role.create(name: "registered_user")
    Role.create(name: "platform_admin")
    puts "Done Creating Roles"
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

  def generate_hosts_and_homes
    puts "Creating Hosts and Homes"
    #create same amount of users as homes
    @num_homes.times do |i|
    User.create!(
        first_name: "Host#{i}",
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password"
        )
    end
    #create homes
    @num_homes.times do |i|
      Home.create!(address:     Faker::Address.street_address,
                              image_url:   "https://robohash.org/#{i}",
                              zip_code:    Faker::Address.zip_code,
                              title:       "Basement #{i}",
                              description: Faker::Hipster.sentence,
                              daily_rate:  40.99)
    end
    #revisit roles already created
    role1 = Role.find_by(name: "registered_user")
    role2 = Role.find_by(name: "host")
    role3 = Role.find_by(name: "platform_admin")
    #for each user, make their role be host and give them a home
    users = User.all
    i = 0
    users.each do |user|
      UserRole.create(user: User.find_by(first_name: "Host#{i}"), role: role2)
      user.home = Home.all[i]
      i +=1
    end
    puts "Done Creating Hosts and Homes"
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
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password"
        )
    end
    puts "Done Creating Users"
  end

  def generate_platform_admin
    puts "Creating Platform admin"
      pa = User.create!(
                        first_name: "PlatformAdmin",
                        last_name: Faker::Name.last_name,
                        email: "platform_admin@gmail.com",
                        password: "password"
                        )
      pa.roles << Role.find_by(name: "platform_admin")
    puts "Done Platform admin"
  end

  def generate_specific_users
   puts "Creating Specific Users"
   User.create!(
     first_name: "user",
     last_name: "user",
     email: "user@gmail.com",
     password: "password"
     )
   User.create!(
     first_name: "josh",
     last_name: "cheek",
     email: "josh@turing.io",
     password: "password"
   )
      marina = User.create!(
        first_name: "Marina",
        last_name: "Corona",
        email: "marina@gmail.com",
        password: "password"
      )

   puts "Done Creating Users"
 end

end

Seed.new
