class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.text :comment
      t.integer :user_id
      t.integer :update_id

      t.timestamps null: false
    end
  end
end
