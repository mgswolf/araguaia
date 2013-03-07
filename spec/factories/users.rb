# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.cor"}
    name "John Doe"
    company "VASP"
    password 'secretpass'
    password_confirmation 'secretpass'
  end
end
