# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess
pics = %w(banner01.jpg banner02.jpg banner03.jpg banner03.jpg)
FactoryGirl.define do
  factory :company do
    sequence(:title) { |n| "Company #{n}"}
    description "MyText"
    cover { fixture_file_upload(Rails.root.join("spec/fixtures/#{pics.sample}"), 'image/jpeg') }
  end
end
