module Api
  class CasesController < ApplicationController
    before_filter :get_teacher
    respond_to :json

    def create
      myCase= @teacher.cases.new(decoded_params['case'])
      myCase.student_id = params[:student_id]
      myCase.subject_id = @teacher.get_subject_at_time(Time.parse time).id
      myCase.class_room_id = @teacher.get_class_room_at_time(Time.parse time).id
      if myCase.save
        history = myCase.case_histories.new status: "open"
        if history.save
          render :json => {success: 'true'}.to_json
        else
          render :json => {success: 'false'}.to_json
        end
      else
        render :json => {success: 'false'}.to_json
      end
    end

    def show
      # detailed case
      render :json => json_for(Case.find(params[:id] || params['id']), :serializer => CaseSerializer)
    end

    def index
      # list of cases related to teacher, or student
      if params[:student_id]
        cases = Student.find(params[:student_id]).cases
        render :json => json_for(cases, :serializer => CasesSerializer, :root => false)
      else
        render :json => json_for(@tutor.cases, :serializer => CasesSerializer)
      end
    end

    def audio
      Case.find(params[:id] || params['id']).audio
    end

  private
    def get_teacher
      @teacher = Teacher.find_by_device_id(decoded_params['device_id'])
      unless @teacher.present?
        render :json => { status: 'error' }.to_json
      end
    end

    def decoded_params
      if params.present? and (params['params'] || params[:params]).present?
        ActiveSupport::JSON.decode(params["params"] || params[:params])
      end
    end

    def time
      # decoded_params['time']
      "2013-06-12T11:00:39Z"
    end
  end
end
