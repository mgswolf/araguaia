# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    title "MyString"
    report_date "2013-02-18"
    description "MyText"
    user nil
  end
end
