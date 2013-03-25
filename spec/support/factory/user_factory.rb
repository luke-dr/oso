FactoryGirl.define do
  sequence :email do |u|
    "traveler#{u}@email.com"
  end

  sequence :name do |n|
    "Traveler_#{n}"
  end

  factory :user do
    name
    email
    password "password"

    factory :admin_user do
      admin true
      after_create do |user|
        user.confirm!
      end
    end

    factory :user_confirmed do
      after_create do |user|
        user.confirm!
      end
    end
  end
end
