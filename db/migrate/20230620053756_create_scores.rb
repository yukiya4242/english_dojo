class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :point
      t.integer :totalpoint

      t.timestamps
    end
  end
end
