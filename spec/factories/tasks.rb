require 'faker'

FactoryGirl.define do
  factory :task do
    sequence(:title)  { |i| Faker::Lorem.word{i}}
    sequence(:comments)  { |i| Faker::Lorem.sentence(3){i}}
    sequence(:start_date)  { |i| Faker::Date.between(3.days.ago, Date.today){i}}
    sequence(:due_date)  { |i| Faker::Date.forward(90){i}}
    sequence(:content)  { |i| Faker::Lorem.sentence(3){i}}
    user_id "7"
  end
end