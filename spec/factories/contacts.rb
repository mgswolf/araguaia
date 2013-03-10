# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "MyString"
    email "MyString"
    phone "MyString"
    subject "MyString"
    body "MyText"
  end
end
