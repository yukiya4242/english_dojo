class RenameQuestionsToQuizzes < ActiveRecord::Migration[7.0]
  def change
    rename_table :questions, :quizzes
  end
end
