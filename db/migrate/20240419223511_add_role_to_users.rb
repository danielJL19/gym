class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :rol, :integer, default: 0
  end
end
