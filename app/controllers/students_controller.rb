class StudentsController < InheritedResources::Base
  respond_to :json

  def index
    @teacher = Teacher.find_by_device_id params[:device_id]
    if params[:time].present? and @teacher.present?
      time = params[:time] # TODO: this has to be parsed/normalized first!
      @students = Timetable.where(:hour => time.hour,
                      :day_of_week => week_day_to_string(time.wday),
                      :teacher_id => @teacher.id
      ).collect { |t| t.student }
      render :json => json_for(@students)
    else
      render :status => 403
    end
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
