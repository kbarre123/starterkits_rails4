# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# # Add Admin role
#roles = Role.create([{name: 'super_admin'}, {name: 'staff'}])
User.create([{
    email: 'info@zacharyreview.com', 
    first_name: 'super', 
    last_name: 'admin', 
    password: 'password', 
    is_admin: true
    }])

5.times do |i|
  Business.create(title: "Business ##{i+1}", text: "A business.", street_no: '123', street:'Maple St.', city:'Zachary', zip_code: '70791', country: 'United States', telephone:'(225) 123-4567', website:'www.website.com', op_hours:'7:00AM-9:00PM, Mon-Sat', category:'Auto Repair')
  User.create([{first_name: "First_#{i+2}", last_name: "Last_#{i+2}", email: "email#{i+2}@example.com", password: "password#{i+2}", password_confirmation: "password#{i+2}"}])
  Review.create(reviewer: "First_#{i+2} Last #{i+2}", review: "User review ##{i+1}", rating: "#{i+1}", business_id: "#{i+1}")
end
