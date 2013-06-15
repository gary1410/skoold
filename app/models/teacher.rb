class Teacher < ActiveRecord::Base
  attr_accessible :name, :tutor_id, :device_id, :password, :login, :first_name

end
