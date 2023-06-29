require 'csv'

csv_files = %w[Adjective Adverb Conjunctive Interjection Noun Preposition Pronoun Verb]

csv_files.each do |file|
  CSV.foreach(Rails.root.join('db', 'csvs', "EnglishDoJo_Quiz_#{file}.csv"), headers: true) do |row|
    Quiz.create!(
      content:   row['content'],
      genre:     row['genre'],
      image_url: row['image_url'],
      meaning:   row['meaning']
      )
    end
  end

unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end

users = [
  {email: 'test@test.com',   username: 'TestUser',   password: 'password'},
  {email: 'test2@test.com',  username: 'Test2User',  password: 'password'},
  {email: 'test3@test.com',  username: 'Test3User',  password: 'password'},
  {email: 'test4@test.com',  username: 'Test4User',  password: 'password'},
  {email: 'test5@test.com',  username: 'Test5User',  password: 'password'},
  {email: 'test6@test.com',  username: 'Test6User',  password: 'password'},
  {email: 'test7@test.com',  username: 'Test7User',  password: 'password'},
  {email: 'test8@test.com',  username: 'Test8User',  password: 'password'},
  {email: 'test9@test.com',  username: 'Test9User',  password: 'password'},
  {email: 'test10@test.com', username: 'Tes10tUser', password: 'password'},
 ]

users.each do |user|
  unless User.exists?(email: user[:email] )
    User.create!(email: user[:email], username: user[:username], password: user[:password], password_confirmation: user[:password])
  end
end



