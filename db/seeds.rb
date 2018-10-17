# Author: Ameya and Sam
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

RealEstateCompany.create!([{
                    name: 'Billy Bobs Mountains',
                    website: 'https://bbobmountains.com',
                    address: 'Memphis, TN',
                    size: '201-500',
                    founded: 2000,
                    revenue: 224000,
                    synopsis: 'we sell mountains'
                           }])
 RealEstateCompany.create!([{
                                name: 'Billy Bobs Trash Cans',
                                website: 'https://bbobtcans.com',
                                address: 'Nashville, TN',
                                size: '1-50',
                                founded: 2017,
                                revenue: 15000,
                                synopsis: 'we sell trash cans and the land theyre on'
                            }])

House.create!([{
                                location: 'Memphis, TN',
                                square_footage: 2047,
                                year: 1987,
                                style: 'Single Family House',
                                price: 215000,
                                floors: 2,
                                basement: 'true',
                                owner: 'Jane and Marshal Mountain',
                                company_id: 1
               }])
 House.create!([{
                    location: 'Nashville, TN',
                    square_footage: 1100,
                    year: 1993,
                    style: 'Apartment',
                    price: 235000,
                    floors: 1,
                    basement: 'false',
                    owner: 'Raine Rocker',
                    company_id: 2
                }])
