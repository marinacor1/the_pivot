FactoryGirl.define do

  factory :home do
    sequence :image_url, ["https://a0.muscache.com/im/pictures/40005ce7-2aa3-4591-baea-9f033093308f.jpg?aki_policy=x_medium", "http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2015/09/Bamboo-Home-Bali-Airbnb-Off-Grid-537x358.jpg", "http://i.huffpost.com/gen/1322228/thumbs/o-MICROHOUSE-AIRBNB-570.jpg?6", "http://assets.urbanturf.com/dc/images/blog/2014/07/portland_airbnb.jpg", "http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2015/02/6-Best-Airbnb-Homes-You-Can-Rent-1-537x358.jpg"].cycle do |n|
      "#{n}"
    end
    sequence(:address) { |n| "123#{n} Main St." }
    sequence(:title) { |n| "This House #{n}" }
    description Faker::Hipster.paragraph
    zip_code 8000
    daily_rate 64.99
  end

  factory :city do
    sequence :name, ["Denver", "Aurora", "Turingopolis"].cycle do |n|
      "#{n}"
    end

    sequence :state, ["CO", "NY", "CA"].cycle do |n|
      "#{n}"
    end

    factory :city_with_homes do
      transient do
        home_count 5
      end

      after(:create) do |city, evaluator|
        create_list(:home, evaluator.home_count, city: city)
      end
    end
  end

end
