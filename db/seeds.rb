# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do 
  Space.create(
    name: Faker::Address.city, 
    capacity: Faker::Number.number(2), 
    price: Faker::Number.number(2)
  )
end

20.times do 
  User.create(email: Faker::Internet.email, password: Faker::Internet.password, name: Faker::Name.name)
end

10.times do
  counter = 1
  team = Team.create(name: Faker::Hipster.words(2).join(" "), active: true)
  team.members << User.find(counter)
  team.members << User.find(counter+=1)
  team.members << User.find(counter+=2)
  team.members << User.find(counter+=3)
  counter += 1
end

10.times do 
counter = 1
Meeting.create(team_id: counter, space_id: counter, time: Faker::Time.forward(14, :evening))
counter += 1
end
