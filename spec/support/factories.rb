FactoryGirl.define do

  factory :home do |n|
    sequence(:address) {|n| "123#{n} Lane St. " }
    zip_code 80203
    sequence(:title) {|n| "This House #{n}" }
    sequence(:description) {|n| "Some description #{n}" }
    daily_rate 64.99
    sequence(:image_url) { |n| "http://robohash.org/#{n}" }
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
        home_count 2
      end

      after(:create) do |city, evaluator|
        create_list(:home, evaluator.home_count, city: city)
      end
    end
  end

end
