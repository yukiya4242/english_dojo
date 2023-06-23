class AddGenreToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :genre, :string
  end
end
