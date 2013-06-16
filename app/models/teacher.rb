class Teacher < ActiveRecord::Base
  attr_accessible :name, :teacher_id, :device_id, :password, :login, :first_name

  has_many :timetables
  has_many :cases

  def new_case(obj, student_id)
    myCase = self.cases.new obj
    myCase.student_id = student_id
    myCase.subject_id = get_subject_at_time("").id
    myCase.class_room_id = get_class_room_at_time("").id
    myCase.severity ||= 0.0
    myCase
  end

  def get_students_at_time(time)
    time=Time.parse "2013-06-12T11:00:39Z"
    @students = Timetable.where(:hour => time.hour.to_s + ":00",:day_of_week => week_day_to_string(time.wday),
                                :teacher_id => self.id
    ).collect { |t| t.student }
  end

  def get_class_room_at_time(time)
    time=Time.parse "2013-06-12T11:00:39Z"
    Timetable.where(:hour => time.hour.to_s + ":00",:day_of_week => week_day_to_string(time.wday),
                                :teacher_id => self.id
    ).first.class_room
  end

  def get_subject_at_time(time)
    time=Time.parse "2013-06-12T11:00:39Z"
    Timetable.where(:hour => time.hour.to_s + ":00",:day_of_week => week_day_to_string(time.wday),
                                :teacher_id => self.id
    ).first.subject
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
