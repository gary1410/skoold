module Api
  class SessionsController < ApplicationController
    def create
      if authorized(params)
        render :json => { first_name: @teacher.first_name, last_name: @teacher.name }.to_json
      else
        render :json => "", :status => 403
      end
    end

    def destroy
    end

  private
    def authorized(params)
      if params[:payload]
        params = ActiveSupport::JSON.decode(params[:payload])
      end
      if params[:login].present? and params[:password].present?
        @teacher = Teacher.where(:login => params[:login], :password => params[:password])
        if @teacher.size > 0
          @teacher = @teacher[0]
          @teacher.update_attribute :device_id, params[:device_id]
        end
      else
        false
      end
    end
  end
end
