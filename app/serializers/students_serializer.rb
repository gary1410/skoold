# class list serializer
class StudentsSerializer < ActiveModel::Serializer
  include ApplicationHelper
  #attributes :first_name, :last_name, :dob, :status, :parent_first_name, :parent_last_name, :parent_phone, :parent_email
  attributes :status, :students

  def status
    "success"
  end

  def students
    json_for(object, :serialize => StudentSerializer)
  end

end
