class Student < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :picture_cache, :first_name, :date_of_birth, :city,
                  :parent_first_name, :parent_last_name, :parent_phone_number , :parent_email

  has_many :timetables
  has_many :cases

  mount_uploader :picture, StudentPictureUploader
end
