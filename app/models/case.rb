class Case < ActiveRecord::Base
  attr_accessible :student_id, :teacher_id, :subject_id, :class_room_id, :message, :memo, :severity

  belongs_to :student
  belongs_to :teacher
  belongs_to :subject
  belongs_to :class_room

  has_many :case_histories

  def status
    case_histories.order(:created_at).last!.status
  end
end
