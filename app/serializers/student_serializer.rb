# single student entry serializer (with details)
class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :dob, :parent_first_name,
             :parent_last_name, :parent_phone, :parent_email, :thumb

  def parent_phone
    object.parent_phone_number
  end

  def first_name
    object.first_name
  end

  def last_name
    object.name
  end

  def dob
    Time.strptime(object.date_of_birth, '%m/%d/%Y').utc.to_s.split(' ')[0..1].join('T')+'Z'
  end

  def thumb
    object.picture.url
  end
end
