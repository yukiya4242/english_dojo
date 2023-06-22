# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end

unless User.exists?(email: 'test@test.com')
  User.create!(email: 'test@test.com', username: 'TestUser', password: 'password', password_confirmation: 'password')
end

#Quizzes
Quiz.create([
  { content: "apple" },
  { content: "banana" },
  { content: "grape" },
  { content: "orange" },
  { content: "melon" },
  ])