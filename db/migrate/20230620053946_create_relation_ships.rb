class CreateRelationShips < ActiveRecord::Migration[7.0]
  def change
    create_table :relation_ships do |t|
      t.integer :follow_id,   null: false
      t.integer :followed_id, null: false

      t.timestamps
    end
  end
end
