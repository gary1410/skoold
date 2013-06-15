class Teacher < ActiveRecord::Base
  attr_accessible :name, :tutor_id, :device_id, :password, :login, :first_name

  has_many :timetables
  has_many :cases
end
