class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    add_column :locations, :email, :string
    add_column :locations, :phone, :string
  end
end
