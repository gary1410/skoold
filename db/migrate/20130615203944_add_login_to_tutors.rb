class AddLoginToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :login, :integer
  end
end
