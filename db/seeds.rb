# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
statuses = Status.create([
  {id:1,nombre:'active',visible:true},
  {id:2,nombre:'inactive',visible:false},
  {id:3,nombre:'deleted',visible:false}
])
active_status = Status.find(Status::VALUES[:active])
admin_users = User.create([
  {email:'admin@admin.com',password:'adminadmin',role: :admin,status:active_status}
])
