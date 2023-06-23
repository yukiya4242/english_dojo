# require 'app/db/contents.csv'

# CSV.foreach(Rails.root.join('db/contents.csv')) do |row|
#   Quiz.create(content: row[0])
# end


unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end

unless User.exists?(email: 'test@test.com')
  User.create!(email: 'test@test.com', username: 'TestUser', password: 'password', password_confirmation: 'password')
end

# Quizzes
Quiz.create([
  { content: "apple" },
  { content: "banana" },
  { content: "grape" },
  { content: "orange" },
  { content: "melon" },
  ])

