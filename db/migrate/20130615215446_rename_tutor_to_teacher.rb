class RenameTutorToTeacher < ActiveRecord::Migration
  def change
    rename_table :tutors, :teachers
  end
end
