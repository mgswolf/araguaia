# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess
pics = %w(pic01.png pic02.png pic03.png)
FactoryGirl.define do
  factory :job_image do
    job nil
    pic { fixture_file_upload(Rails.root.join("spec/fixtures/#{pics.sample}"), 'image/png') }
  end
end
