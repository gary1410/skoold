class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :class_room_id
      t.integer :subject_id
      t.integer :teacher_id
      t.integer :student_id
      t.string :day_of_week
      t.string :hour
      t.timestamps
    end
  end
end
