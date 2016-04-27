FactoryGirl.define do
  factory :coder do |n|
    sequence(:name) {|n| "name #{n}" }
    sequence(:experience) {|n| "experience #{n}"}
    sequence(:cost) {|n| n}
    sequence(:image_url) {|n| "image_#{n}.png"}
  end

  factory :category do |n|
    sequence(:name) {|n| "name #{n}" }
  end

  factory :user do |n|
    sequence(:name) {|n| "name #{n}" }
    sequence(:username) {|n| "username #{n}" }
    sequence(:email) {|n| "email#{n}@email.com" }
    sequence(:organization) {|n| "organization #{n}" }
    sequence(:password) { "password" }
  end
end
