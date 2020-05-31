class CreateManagedLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :location_managers do |t|
      t.integer :location_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
