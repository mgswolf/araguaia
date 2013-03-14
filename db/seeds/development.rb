#Dir[Rails.root.join("spec/factories/*.rb")].each do |file|
#  require file
#end
require 'faker'
puts '---Cleaning DataBase --'
[User,Job,JobImage,LaboratoryItem,Report,Service,Banner,Contact,Equipment,Company].map(&:delete_all)

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
    users << FactoryGirl.create(:user, {
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
    FactoryGirl.create(:service,{
      title: Faker::Lorem.sentence([*3..10].sample),
      caption: Faker::Lorem.sentence([*3..10].sample),
      description: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n")
  })
end

#Reports
puts '---Creating Reports---'
30.times do
  time = Time.now.to_date
    FactoryGirl.create(:report,{
      title: Faker::Company.name,
      report_date: time,
      description: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n"),
      user: users.sample
  })
end

#Equipment
puts '---Creating Equipments---'
30.times do
  FactoryGirl.create(:equipment,{
      title: Faker::Lorem.sentence([*1..10].sample),
      description: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n")
  })
end

#laboratory_item
puts '---Creating Laboratory Items---'
30.times do
  FactoryGirl.create(:laboratory_item,{
      title: Faker::Lorem.sentence([*1..10].sample),
      description: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n")
  })
end

#contacts
puts '---Creating Contacts---'
30.times do
  name = Faker::Name.name
  FactoryGirl.create(:contact,{
      name:  name,
      email: Faker::Internet.email(name),
      subject: Faker::Lorem.sentence([*1..10].sample),
      phone: Faker::PhoneNumber.phone_number,
      body: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n")
  })
end

#banners
puts '---Creating Banners---'
4.times { FactoryGirl.create(:banner) }

#companies
puts '---Creating Company---'
30.times do
  FactoryGirl.create(:company,{
      title: Faker::Lorem.sentence([*1..10].sample),
      description: Faker::Lorem.paragraphs([*1..5].sample).join("\n\n")
  })
end