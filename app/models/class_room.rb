class ClassRoom < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name

  has_many :timetables
  has_many :cases
end
