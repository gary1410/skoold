class SessionsController < ApplicationController
  def create
    if authorized(params)
      render :json => { first_name: @tutor.first_name, last_name: @tutor.name, id: @tutor.id }.to_json
    else
      render :status => 403
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
      @tutor = Tutor.where(:login => params[:login], :password => params[:password])
      if @tutor.size > 0
        @tutor = @tutor[0]
        @tutor.update_attribute :device_id, params[:device_id]
      end
    else
      false
    end
  end
end
