require 'faker'

FactoryGirl.define do
  factory :post do
    sequence(:content)  { |i| Faker::Lorem.sentence(2){i}}
    sequence(:comments)  { |i| Faker::Lorem.sentence(5){i}}
    user_id "7"
  end
end