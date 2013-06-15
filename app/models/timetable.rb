class Timetable < ActiveRecord::Base
  attr_accessible :teacher_id, :student_id, :class_room_id, :subject_id, :day_of_week, :hour
  belongs_to :teacher
  belongs_to :student
  belongs_to :class_room
  belongs_to :subject
end
