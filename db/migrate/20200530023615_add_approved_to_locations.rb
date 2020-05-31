class AddApprovedToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :approved, :boolean
  end
end
