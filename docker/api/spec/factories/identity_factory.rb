FactoryGirl.define do
  factory :identity do
    uid '12345'
    provider 'facebook'
    association :user, factory: :user
  end
end