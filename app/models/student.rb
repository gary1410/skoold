class Student < ActiveRecord::Base
  attr_accessible :description, :name, :picture
  mount_uploader :picture, StudentPictureUploader
end
