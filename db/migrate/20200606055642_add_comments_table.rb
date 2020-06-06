class AddCommentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :location_id
      t.integer :user_id
      t.text :body
      t.timestamps null: false
    end
  end
end
