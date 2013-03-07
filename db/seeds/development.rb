#Dir[Rails.root.join("spec/factories/*.rb")].each do |file|
#  require file
#end
require 'faker'
puts '---Cleaning DataBase --'
[User,Job,LaboratoryItem,Report,Service].map(&:delete_all)

#admin
puts '---Creating Admin user ---'
admin_user = User.create!(email: 'admin@araguaia.com.br', password: 'araguaia', company: 'Araguaia', name: 'Admin Araguaia')
admin_user.toggle(:admin)
admin_user.save!

#normal users
puts '---Creating Normal Users---'
 users = []
  10.times do
    name = Faker::Name.name
    FactoryGirl.create(:user, {
      name: name,
      email: Faker::Internet.email(name),
      company: Faker::Company.name
    })
  end

#jobs
puts '---Creating Jobs---'
jobs = []
30.times do
  jobs << FactoryGirl.create(:job,{
    title: Faker::Lorem.sentence([*3..10].sample),
    caption: Faker::Lorem.sentence([*3..10].sample),
    description: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n")
  })
end

#job_images
puts '---Creating and adding images to jobs---'
30.times do
  FactoryGirl.create(:job_image,{
      job: jobs.sample
  })
end

#Services
puts '---Creating Services---'
30.times do
  jobs << FactoryGirl.create(:service,{
      title: Faker::Lorem.sentence([*3..10].sample),
      caption: Faker::Lorem.sentence([*3..10].sample),
      description: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n")
  })
end