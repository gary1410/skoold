class AddFirstNameToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :first_name, :string
  end
end
