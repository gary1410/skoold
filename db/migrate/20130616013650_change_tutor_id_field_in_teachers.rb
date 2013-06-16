class ChangeTutorIdFieldInTeachers < ActiveRecord::Migration
  def change
    rename_column :teachers, :tutor_id, :teacher_id
  end
end
