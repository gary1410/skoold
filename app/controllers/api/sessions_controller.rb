module Api
  class SessionsController < ApplicationController
    def create
      if authorized(params)
        render :json => { first_name: @teacher.first_name, last_name: @teacher.name, status: 'success',
                          subject: @teacher.get_subject_at_time("").name }.to_json
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

    def time
      # decoded_params['time']
      "2013-06-12T11:00:39Z"
    end

  end
end
