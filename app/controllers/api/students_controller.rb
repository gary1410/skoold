module Api
  class StudentsController < InheritedResources::Base
    respond_to :json

    def index
      @teacher = Teacher.find_by_device_id params[:device_id]
      if params[:time].present? and @teacher.present?
        time = Time.parse params[:time]
        render :json => json_for(@teacher.get_students_at_time(time), serializer: StudentsSerializer, :root => false)
      else
        render :json => { status: 'error' }.to_json
      end
    end

    def show
      @teacher = Teacher.find_by_device_id params[:device_id]
      @student = Student.find(params[:id])
      if @teacher.present? and @student.present?
        render :json => json_for(@student, serializer: StudentSerializer)
      else
        render :json => { status: 'error' }.to_json
      end
    end

  end
end
