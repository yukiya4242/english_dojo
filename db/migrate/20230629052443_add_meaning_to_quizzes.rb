class AddMeaningToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :meaning, :string
  end
end
