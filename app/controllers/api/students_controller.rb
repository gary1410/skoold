module Api
  class StudentsController < InheritedResources::Base
    respond_to :json

    def index
      @teacher = Teacher.find_by_device_id params[:device_id]
      if params[:time].present? and @teacher.present?
        time = Time.parse params[:time]
        render :json => json_for(@teacher.get_students_at_time(time), serializer: StudentsSerializer)
      else
        render :status => 403
      end
    end

    def show
      @teacher = Teacher.find_by_device_id params[:device_id]
      @student = Student.find(params[:id])
      if @teacher.present? and @student.present?
        render :json => json_for(@student, serializer: StudentSerializer)
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
end
