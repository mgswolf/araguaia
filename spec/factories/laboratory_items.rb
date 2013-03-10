# Read about factories at https://github.com/thoughtbot/factory_girl
pics = %w(pic01.png pic02.png pic03.png)
FactoryGirl.define do
  factory :laboratory_item do
    title "MyString"
    description "Lorem"
    cover { fixture_file_upload(Rails.root.join("spec/fixtures/#{pics.sample}"), 'image/png') }
  end
end
