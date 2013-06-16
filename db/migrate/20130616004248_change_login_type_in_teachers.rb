class ChangeLoginTypeInTeachers < ActiveRecord::Migration
  def up
    change_column :teachers, :login, :string
  end

  def down
    change_column :teachers, :login, :integer
  end
end
