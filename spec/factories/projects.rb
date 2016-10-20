require 'faker'

FactoryGirl.define do
  factory :project do
    sequence(:name)  { |i| Faker::Lorem.word{i}}
    sequence(:summary)  { |i| Faker::Lorem.sentence(3){i}}
    sequence(:start_date)  { |i| Faker::Date.between(3.days.ago, Date.today){i}}
    sequence(:end_date)  { |i| Faker::Date.forward(90){i}}
    user_id "7"
  end
end