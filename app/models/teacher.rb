class Teacher < ActiveRecord::Base
  attr_accessible :name, :teacher_id, :device_id, :password, :login, :first_name

  has_many :timetables
  has_many :cases

  def get_students_at_time(time)
    @students = Timetable.where(:hour => time.hour.to_s + ":00",:day_of_week => week_day_to_string(time.wday),
                                :teacher_id => self.id
    ).collect { |t| t.student }
  end

private
  def week_day_to_string(wday)
    case wday
      when 0 then "Monday"
      when 1 then "Tuesday"
      when 2 then "Wednesday"
      when 3 then "Thursday"
      when 4 then "Friday"
      when 5 then "Saturday"
      when 6 then "Sunday"
    end
  end
end
