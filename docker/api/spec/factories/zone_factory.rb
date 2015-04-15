FactoryGirl.define do
  factory :zone do
    name 'Test Zone'
    radius 500
    latitude 25.75663
    longitude 37.32684
    association :user, factory: :user
    visible true
  end
end