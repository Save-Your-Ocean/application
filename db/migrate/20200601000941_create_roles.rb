class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :title

      t.timestamps null: false
    end
    
    add_column :users, :role_id, :integer
  end
end
