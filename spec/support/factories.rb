FactoryGirl.define do

  factory :coder do |n|
    sequence(:name) {|n| "name #{n}" }
    sequence(:experience) {|n| "experience #{n}"}
    sequence(:cost) {|n| "cost #{n}"}
    sequence(:image_url) {|n| "image_#{n}.png"}
  end

  factory :category do |n|
    sequence(:name) {|n| "name #{n}" }
  end
end
