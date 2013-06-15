class Case < ActiveRecord::Base
  attr_accessible :student_id, :teacher_id, :subject_id, :class_room_id, :message, :memo, :severity

  belongs_to :student
  belongs_to :teacher
  belongs_to :subject
  belongs_to :class_room
end
