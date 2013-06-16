module Api
  class CasesController < ApplicationController
    before_filter :get_teacher
    respond_to :json

    def create
      newCase = @teacher.new_case(decoded_params['case'] || decoded_params[:case], params["student_id"] || params[:student_id])
      if newCase.save
        history = newCase.case_histories.new status: "open"
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
      if params[:student_id] || params["student_id"]
        cases = Student.find(params[:student_id] || params["student_id"]).cases
        render :json => json_for(cases, :serializer => CasesSerializer, :root => false)
      else
        render :json => json_for(@tutor.cases, :serializer => CasesSerializer)
      end
    end

    def audio
      Case.find(params[:id] || params['id']).audio
    end

  end
end
