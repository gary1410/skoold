module Api
  class SessionsController < ApplicationController
    before_filter :get_teacher, :only => [:destroy]

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
      if (decoded_params['login'] || decoded_params[:login]).present? and (decoded_params['password'] || decoded_params[:password]).present?
        @teacher = Teacher.where(:login => (decoded_params['login'] || decoded_params[:login]), :password => (decoded_params['password'] || decoded_params[:password])).first
        if @teacher.present?
          Teacher.where(:device_id => decoded_params[:device_id] || decoded_params['device_id']).update_all :device_id => nil
          @teacher.reload.update_attribute :device_id, decoded_params[:device_id] || decoded_params['device_id']
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
