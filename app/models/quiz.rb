class Quiz < ApplicationRecord

  def self.random_question(genre_name = nil)
    if genre_name
      question = Quiz.where(genre: genre_name).order("RANDOM()").first #Questionテーブルからレコードをランダムに並び替えて取得
    else
      question = Quiz.order("RANDOM()").first
    end
    content = question.content
    half_length = (content.length / 2.0).ceil #単語の長さを2で割り、その結果を小数点切り上げ(ceil)して半分の長さを計算
    hidden_content = content[0, half_length] + '_' * half_length
    { question: hidden_content, answer: content, id: question.id }
  end
end
