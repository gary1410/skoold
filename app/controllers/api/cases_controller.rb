module Api
  class CasesController < ApplicationController
    before_filter :get_teacher
    respond_to :json

    def create
      @teacher.cases.create params[:case]
    end

    def show
      # detailed case
      render :json => json_for(Case.find(params[:id]), :serializer => CaseSerializer)
    end

    def index
      # list of cases related to teacher
      render :json => json_for(@tutor.cases, :serializer => CasesSerializer)
    end

    def audio
      Case.find(params[:id]).audio
    end

  private
    def get_teacher
      @teacher = Teacher.find_by_device_id params[:device_id]
      unless @teacher.nil?
        render :json => { status: 'error' }.to_json
      end
    end
  end
end
