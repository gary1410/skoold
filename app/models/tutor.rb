class Tutor < ActiveRecord::Base
  attr_accessible :login, :name, :password, :device_id
end
