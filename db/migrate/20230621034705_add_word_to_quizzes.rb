class AddWordToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :word, :string
  end
end
