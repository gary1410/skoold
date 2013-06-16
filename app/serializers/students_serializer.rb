# class list serializer
class StudentsSerializer < ActiveModel::Serializer
  include ApplicationHelper
  attributes :status, :students, :subject

  def status
    "success"
  end

  def students
    ActiveSupport::JSON.decode json_for(object, :serialize => StudentSerializer)
  end

  def subject
    options[:subject]
  end
end
