class AddColumnsToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :facebook_handle, :string
    add_column :locations, :image, :string
    add_column :locations, :twitter_handle, :string
    add_column :locations, :facebook_handle, :string
  end
end
