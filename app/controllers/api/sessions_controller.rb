module Api
  class SessionsController < ApplicationController
    def create
      if authorized(params)
        render :json => { first_name: @teacher.first_name, last_name: @teacher.name, status: 'success' }.to_json
      else
        render :json => { status: 'error' }.to_json
      end
    end

    def destroy
    end

  private
    def authorized(params)
      if params[:params]
        params = ActiveSupport::JSON.decode(params[:params])
      end
      if params['login'].present? and params['password'].present?
        @teacher = Teacher.where(:login => params['login'], :password => params['password'])
        if @teacher.size > 0
          @teacher = @teacher[0]
          @teacher.update_attribute :device_id, params['device_id']
        end
      else
        false
      end
    end
  end
end
