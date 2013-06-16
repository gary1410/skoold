module Api
  class StudentsController < InheritedResources::Base
    respond_to :json

    def index
      @teacher = Teacher.find_by_device_id decoded_params['device_id']
      if time.present? and @teacher.present?
        render :json => json_for(@teacher.get_students_at_time(Time.parse time), serializer: StudentsSerializer, :root => false)
      else
        render :json => { status: 'error' }.to_json
      end
    end

  private
    def decoded_params
      if params.present? and (params['params'] || params[:params]).present?
        ActiveSupport::JSON.decode(params["params"] || params[:params])
      else
        params
      end
    end

    def time
      # decoded_params['time']
      "2013-06-12T11:00:39Z"
    end

  end
end
