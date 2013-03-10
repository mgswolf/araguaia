# Read about factories at https://github.com/thoughtbot/factory_girl
annexes = %w(report1.pdf report2.pdf)
FactoryGirl.define do
  factory :report do
    title "MyString"
    report_date "2013-02-18"
    description "MyText"
    user nil
    annex { fixture_file_upload(Rails.root.join("spec/fixtures/#{annexes.sample}"), 'application/pdf') }
  end
end
