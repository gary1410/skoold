module Api
  class StudentsController < InheritedResources::Base
    before_filter :get_teacher
    respond_to :json

    def index
      if time.present? and @teacher.present?
        render :json => json_for(@teacher.get_students_at_time(time), serializer: StudentsSerializer, :root => false,
                                 :subject => @teacher.get_subject_at_time(time).name )
      else
        render :json => { status: 'error' }.to_json
      end
    end

  end
end
