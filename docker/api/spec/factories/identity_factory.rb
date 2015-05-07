FactoryGirl.define do
  factory :identity do
    uid '12345'
    provider 'facebook'
    user
  end
end