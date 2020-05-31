class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :lat
      t.string :lng

      t.timestamps null: false
    end
  end
end
