# Read about factories at https://github.com/thoughtbot/factory_girl
pics = %w(cover01.png cover02.png cover03.png)
FactoryGirl.define do
  factory :service do
    title "MyString"
    description "MyText"
    caption "MyString"
    cover { fixture_file_upload(Rails.root.join("spec/fixtures/#{pics.sample}"), 'image/png') }
  end
end
