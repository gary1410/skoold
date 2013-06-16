class AddChildToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :child_id, :integer
  end
end
