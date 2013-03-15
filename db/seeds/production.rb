# encoding: utf-8
[User,Job,JobImage,LaboratoryItem,Report,Service,Banner,Contact,Equipment,Company].map(&:delete_all)

#admin
puts '---Creating Admin user ---'
admin_user = User.create!(email: 'arahidro@gmail.com', password: 'Araguaia', company: 'Araguaia - Serviços Hidrométricos - Laboratório de Hidrossedimentometria', name: 'Admin Araguaia')
admin_user.toggle(:admin)
admin_user.save!