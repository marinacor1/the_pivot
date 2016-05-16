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
    home_urls = ["http://i.huffpost.com/gen/1322250/thumbs/o-ECO-LODGE-AIRBNB-570.jpg?6",
                          "https://a0.muscache.com/im/pictures/40005ce7-2aa3-4591-baea-9f033093308f.jpg?aki_policy=x_medium",
                          "http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2015/09/Bamboo-Home-Bali-Airbnb-Off-Grid-537x358.jpg",
                          "http://i.huffpost.com/gen/1322228/thumbs/o-MICROHOUSE-AIRBNB-570.jpg?6",
                          "http://assets.urbanturf.com/dc/images/blog/2014/07/portland_airbnb.jpg",
                          "http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2015/02/6-Best-Airbnb-Homes-You-Can-Rent-1-537x358.jpg",
                        "http://www.cement.org/images/default-source/default-album/insulated-concrete-forms-home.jpg?sfvrsn=0",
                      "http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2012/09/Doe-Bay-Cottage-Method-Homes-5-537x335.jpg",
                    "http://www.rockfordhomes.net/sites/default/files/news-images/rockford_homes_new-homes-columbus.jpg",
                  "http://www.thenester.com/wp-content/uploads/2011/12/DSC_0134-550x365.jpg",
                "http://www.ryanhomes.com/assets/images/kitchen-thumb.jpg",
              "http://www.eagleriverhomes.net/img/home_slider/60J060%20LR.jpg",
            "http://clv.h-cdn.co/assets/cm/15/10/640x480/gallery_54f0d9d889efa_-_01-millertinyhouse-048-edit1-lgn.jpg",
          "http://www.rpmmidwest.com/wp-content/uploads/2015/02/http-www.wfs_.orgblogsthomas-freywhy-tiny-home-movement-may-not-be-so-tiny.jpg"]

    @num_homes.times do |i|
      Home.create!(address:     Faker::Address.street_address,
                              image_url:   "#{home_urls[rand(0..13)]}",
                              zip_code:    Faker::Address.zip_code,
                              title:       "Basement #{i}",
                              description: Faker::Hipster.sentence,
                              daily_rate:  40.99)
    end
    #revisit roles already created
    role2 = Role.find_by(name: "host")
    #for each user, make their role be host and give them a home
    users = User.all

    @num_homes.times do |i|
      host = User.find_by(first_name: "Host#{i}")
      UserRole.create(user: host, role: role2)
      host.home = Home.all[i]
      host.save
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

   puts "Done Creating Users"
 end

end

Seed.new
