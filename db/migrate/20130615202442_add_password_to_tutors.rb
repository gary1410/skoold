class AddPasswordToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :password, :string
  end
end
