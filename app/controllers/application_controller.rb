class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def decoded_params
    if params.present? and (params['params'] || params[:params]).present?
      ActiveSupport::JSON.decode(params["params"] || params[:params])
    else
      params
    end
  end

  def get_teacher
    @teacher = Teacher.find_by_device_id(decoded_params['device_id'] || decoded_params[:device_id])
    unless @teacher.present?
      render :json => { status: 'error' }.to_json
    end
  end

  def time
    # decoded_params['time']
    Time.parse "2013-06-12T11:00:39Z"
  end
end
