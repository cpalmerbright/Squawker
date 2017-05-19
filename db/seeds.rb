require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
Comment.delete_all
User.delete_all

User.create!(email: 'test@test.com',
             password: 'password',
             password_confirmation: 'password')

5.times do
  pword = Faker::Internet.password
  User.create!(email: Faker::Internet.email,
               password: pword,
               password_confirmation: pword
  )
end

20.times do
  Post.create!(content: Faker::Lorem.sentence(1),
               user_id: Faker::Number.between(User.first.id, User.last.id),
  )
end

50.times do
  Comment.create!(content: Faker::Lorem.sentence(1),
                  user_id: Faker::Number.between(User.first.id, User.last.id),
                  post_id: Faker::Number.between(Post.first.id, Post.last.id),
  )
end
