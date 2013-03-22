FactoryGirl.define do
  factory :itinerary do
    sequence(:name)  { |i| "Example Itinerary_#{i}" }
  end
end
