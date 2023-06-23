class AddImageUrlToQuizzez < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzezs, :image_url, :string
  end
end
