class Subject < ActiveRecord::Base
  attr_accessible :name

  has_many :timetables
  has_many :cases
end
