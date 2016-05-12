FactoryGirl.define do

  factory :home do
    sequence(:image_url) { |n| "http://robohash.org/#{n}" }
    sequence(:address) { |n| "123#{n} Main St." }
    sequence(:title) { |n| "This House #{n}" }
    description Faker::Hipster.paragraph
    zip_code 8000
    daily_rate 64.99
  end

  factory :user do
    :first_name Faker::Name.first_name
    :last_name Faker::Name.last_name
    :email Faker::Internet.email
    :password "password"
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
