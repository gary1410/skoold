class AddSuperUserToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :super_user, :boolean, :default => false, :null => false
  end
end
