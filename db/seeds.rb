# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 require 'faker'

 User.create!([{
                   name: 'Admin',
                   email: 'administrator@admin.in',
                   password: 'password',
                   roles: 0,
                   phone_number: '1800-22-3333',
                   preferred_contact_method: 'email',
               }])

 User.create!([{
                   name: 'realtor',
                   email: 'realestateagent@realtor.in',
                   password: 'password',
                   roles: 2,
                   phone_number: '1800-33-4444',
                   preferred_contact_method: 'text',
                   company_id: Faker::Number.between(1,10)
               }])

 User.create!([{
                   name: 'hunter',
                   email: 'househunter@hunter.in',
                   password: 'password',
                   roles: 1,
                   phone_number: '1800-44-5555',
                   preferred_contact_method: 'text'
               }])

 20.times do
   User.create(
       name: Faker::Name.first_name,
       email: Faker::Internet.email,
       password: 'password',
       roles: 2,
       phone_number: Faker::PhoneNumber.phone_number,
       preferred_contact_method: 'email',
       company_id: Faker::Number.between(1,10)
   )
 end
