# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago'}, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Load users'

admins = [
         {
					:email => "admin@sheltersoft.in", 
					:password => "ShelterSoft777", 
					:password_confirmation => "ShelterSoft777", 
					:first_name =>"Admin", 
					:last_name =>"Admin", 
					:company => "ShelterSoft"}
        ]
admins.each do |u|
  user = AdminUser.find_or_create_by(
					:email => u[:email])
  user.email              = u[:email]
  user.password           = u[:password]
  user.password_confirmation = u[:password_confirmation]
  user.save!
end