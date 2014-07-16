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
users = User.create([{
    email: 'info.zacharyreview@gmail.com', 
    first_name: 'super', 
    last_name: 'admin', 
    password: 'password', 
    password_confirmation: 'password', 
    is_admin: true
    }])
