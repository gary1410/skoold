class SessionsController < ApplicationController
  def create
    @tutor = Tutor.where(:login => params[:login], :password => params[:password])
    if @tutor.size > 0
      @tutor = @tutor[0]
      @tutor.update_attribute :device_id, params[:device_id]
    else
      render :status => 403
    end
    render :json => ""
  end

  def destroy
  end
end
