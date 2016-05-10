FactoryGirl.define do
  factory :city do
    sequence :name, ["Denver", "Aurora", "turing"].cycle do |n|
      "#{n}"
    end

    sequence :state, ["CO", "NY", "CA"].cycle do |n|
      "#{n}"
    end
  end
end
