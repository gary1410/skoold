module Api
  class CasesController < ApplicationController
    before_filter :get_teacher
    respond_to :json

    def create
      @teacher.cases.create params[:case]
    end

    def show

    end

    def index

    end

    def audio

    end

  private
    def get_teacher
      @teacher = Teacher.find_by_device_id params[:device_id]
      unless @teacher.nil?
        render :status => 403
      end
    end
  end
end
