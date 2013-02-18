# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#admin
admin_user = User.create!(email: 'admin@araguaia.com.br', password: 'araguaia', company: 'Araguaia', name: 'Admin Araguaia')
admin_user.toggle(:admin)
admin_user.save!

