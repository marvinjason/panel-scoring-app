# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create email: 'admin@gmail.com', password: '123456', is_admin: true
User.create email: 'test1@gmail.com', password: '123456'
User.create email: 'test2@gmail.com', password: '123456'
User.create email: 'test3@gmail.com', password: '123456'
User.create email: 'test4@gmail.com', password: '123456'
User.create email: 'test5@gmail.com', password: '123456'

Project.create name: 'Jac Liner Bus Buddy', id: 1
Project.create name: 'English to Chavacano', id: 2
Project.create name: 'PLAPP', id: 3
Project.create name: 'Data Structure', id: 4
Project.create name: 'Product Review Platform', id: 5
Project.create name: 'Online Retail System', id: 6
Project.create name: 'TARA', id: 7
Project.create name: 'Flying First Aid Kit', id: 8
Project.create name: 'Android Based Path Finder', id: 9
Project.create name: 'GAIT', id: 10
Project.create name: 'Preggorie', id: 11
Project.create name: 'DOTHS', id: 12
Project.create name: 'IDECODE', id: 13
Project.create name: 'Synctify', id: 14
Project.create name: 'Facial', id: 15
Project.create name: 'Kalamity', id: 16
