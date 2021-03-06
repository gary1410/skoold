class CaseSerializer < ActiveModel::Serializer
  attributes :case_id, :subject, :classroom, :message, :memo, :teacher_first_name, :teacher_last_name, :timestamp, :severity, :status

  def case_id
    object.id
  end

  def subject
    object.subject.name
  end

  def classroom
    object.class_room.name
  end

  def message
    object.message || ""
  end

  def memo
    if object.memo.present?
      object.memo.url
    else
      ""
    end
  end

  def teacher_first_name
    object.teacher.first_name
  end

  def teacher_last_name
    object.teacher.name
  end

  def timestamp
    object.created_at.utc.to_s.split(' ')[0..1].join('T')+'Z'
  end

  def status
    object.status || ""
  end

  def severity
    object.severity
  end
end
