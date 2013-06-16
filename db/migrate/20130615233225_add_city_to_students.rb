class AddCityToStudents < ActiveRecord::Migration
  def change
    add_column :students, :city, :string
  end
end
