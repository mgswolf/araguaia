# Read about factories at https://github.com/thoughtbot/factory_girl
pics = %w(cover01.png cover02.png cover03.png)
FactoryGirl.define do
  factory :job do
    sequence(:title) { |n| "Job #{n}"}
    caption "MyString"
    description "MyText"
    cover { fixture_file_upload(Rails.root.join("spec/fixtures/#{pics.sample}"), 'image/png') }
  end
end
