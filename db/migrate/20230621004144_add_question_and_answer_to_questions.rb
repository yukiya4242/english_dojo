class AddQuestionAndAnswerToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :questions, :string
    add_column :questions, :answers, :string
  end
end
