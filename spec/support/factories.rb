FactoryGirl.define do

  factory :item do |n|
    sequence(:name) {|n| "name #{n}" }
    sequence(:description) {|n| "description #{n}"}
    sequence(:image_url) {|n| "image_#{n}.png"}
  end

  factory :category do |n|
    sequence(:name) {|n| "name #{n}" }
  end
end
