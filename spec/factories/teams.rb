require 'faker'

FactoryGirl.define do
  factory :team do
   sequence(:name)  { |i| Faker::Team.creature{i}}
  end
end