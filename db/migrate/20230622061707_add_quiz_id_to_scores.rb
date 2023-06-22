class AddQuizIdToScores < ActiveRecord::Migration[7.0]
  def change
    add_reference :scores, :quiz, foreign_key: true
  end
end
