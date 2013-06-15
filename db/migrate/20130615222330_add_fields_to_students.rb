class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :date_of_birth, :string
    add_column :students, :parent_first_name, :string
    add_column :students, :parent_last_name, :string
    add_column :students, :parent_phone_number, :string
    add_column :students, :parent_email, :string
  end
end
