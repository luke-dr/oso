FactoryGirl.define do
  sequence :email do |n|
    "traveler#{n}@email.com"
  end

  factory :user do
    first_name "Mike"
    last_name "Traveler"
    email
  end
end
