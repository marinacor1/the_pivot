FactoryGirl.define do

  factory :home do |n|
    sequence(:address) {|n| "123#{n} Lane St. " }
    sequence(:zip_code) {|n| "8000#{n}" }
    sequence(:title) {|n| "This House #{n}" }
    sequence(:description) {|n| "Some description #{n}" }
    sequence(:daily_rate) { "#{n}" }
    sequence(:image_url) { "http://robohash.org/#{n}" }
  end

  factory :city do
    sequence :name, ["Denver", "Aurora", "Turingopolis"].cycle do |n|
      "#{n}"
    end
​
    sequence :state, ["CO", "NY", "CA"].cycle do |n|
      "#{n}"
    end
​
    factory :city_with_homes do
      transient do
        homes_count 4
      end
​
      after(:create) do |city, evaluator|
        create_list(:home, evaluator.home_count, city: city)
      end
    end
  end

end
