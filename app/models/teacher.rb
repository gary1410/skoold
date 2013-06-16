class Teacher < ActiveRecord::Base
  attr_accessible :name, :teacher_id, :device_id, :password, :login, :first_name

  def get_students_at_time(time)
    @students = Timetable.where(:hour => time.hour,
                                :day_of_week => week_day_to_string(time.wday),
                                :teacher_id => @teacher.id
    ).collect { |t| t.student }
  end

  has_many :timetables
  has_many :cases
end
