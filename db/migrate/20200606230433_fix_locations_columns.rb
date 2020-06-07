class FixLocationsColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :address, :street
    remove_column :locations, :lat
    remove_column :locations, :lng
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
