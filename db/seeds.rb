require 'csv'

csv_files = %w[Adjective Adverb Conjunctive Interjection Noun Preposition Pronoun Verb]

csv_files.each do |file|
  CSV.foreach(Rails.root.join('db', 'csvs', "EnglishDoJo_Quiz_#{file}.csv"), headers: true) do |row|
    Quiz.create!(
      content:   row['content'],
      genre:     row['genre'],
      image_url: row['image_url']
      )
    end
  end

unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end

unless User.exists?(email: 'test@test.com')
  User.create!(email: 'test@test.com', username: 'TestUser', password: 'password', password_confirmation: 'password')
end



# Quizzes
# Quiz.create([
#   { content: "apple", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/apple.jpeg" },
#   { content: "banana", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/banana.jpeg" },
#   { content: "grape", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/grape.jpeg" },
#   { content: "orange", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/orange.jpeg" },
#   { content: "melon", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/melon.jpeg" },
#   { content: "lemon", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/lemon.jpeg" },
#   { content: "cat", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/cat.jpeg" },
#   { content: "dog", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/dog.jpeg" },
#   { content: "car", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/car.jpeg" },
#   { content: "book", genre: "名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/book.jpeg" },
#   { content: "you", genre: "代名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/you.jpeg" },
#   { content: "he", genre: "代名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/he.jpeg" },
#   { content: "she", genre: "代名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/she.jpeg" },
#   { content: "it", genre: "代名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/it.jpeg" },
#   { content: "they", genre: "代名詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/they.jpeg" },
#   { content: "run", genre: "動詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/run.jpeg" },
#   { content: "walk", genre: "動詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/walk.jpeg" },
#   { content: "eat", genre: "動詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/eat.jpeg" },
#   { content: "sleep", genre: "動詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/sleep.jpeg" },
#   { content: "play", genre: "動詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/play.jpeg" },
#   { content: "happy", genre: "形容詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/happy.jpeg" },
#   { content: "sad", genre: "形容詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/sad.jpeg" },
#   { content: "big", genre: "形容詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/big.jpeg" },
#   { content: "small", genre: "形容詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/small.jpeg" },
#   { content: "fast", genre: "形容詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/fast.jpeg" },
#   { content: "quickly", genre: "副詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/quickly.jpeg" },
#   { content: "slowly", genre: "副詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/slowly.jpeg" },
#   { content: "happily", genre: "副詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/happily.jpeg" },
#   { content: "sadly", genre: "副詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/sadly.jpeg" },
#   { content: "silently", genre: "副詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/silently.jpeg" },
#   { content: "on", genre: "前置詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/on.jpeg" },
#   { content: "in", genre: "前置詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/in.jpeg" },
#   { content: "at", genre: "前置詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/at.jpeg" },
#   { content: "from", genre: "前置詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/from.jpeg" },
#   { content: "with", genre: "前置詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/with.jpeg" },
#   { content: "and", genre: "接続詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/and.jpeg" },
#   { content: "but", genre: "接続詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/but.jpeg" },
#   { content: "or", genre: "接続詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/or.jpeg" },
#   { content: "so", genre: "接続詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/so.jpeg" },
#   { content: "yet", genre: "接続詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/yet.jpeg" },
#   { content: "oh", genre: "間投詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/oh.jpeg" },
#   { content: "wow", genre: "間投詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/wow.jpeg" },
#   { content: "ah", genre: "間投詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/ah.jpeg" },
#   { content: "hmm", genre: "間投詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/hmm.jpeg" },
#   { content: "uh", genre: "間投詞", image_url: "https://imge-url.s3.ap-northeast-1.amazonaws.com/uh.jpeg" },
# ])




