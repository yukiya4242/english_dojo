class AddImageUrlToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :image_url, :string
  end
end
