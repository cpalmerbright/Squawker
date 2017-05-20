require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
Comment.destroy_all
User.destroy_all

User.create!(email: 'test@test.com',
             password: 'password',
             password_confirmation: 'password',
             first_name: 'Test',
             last_name: 'McTesterson',
             username: 'test'
)

5.times do
  pword = Faker::Internet.password
  User.create!(email: Faker::Internet.email,
               password: pword,
               password_confirmation: pword,
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               username: Faker::Internet.user_name
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
