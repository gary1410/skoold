class StudentsController < InheritedResources::Base
  respond_to :json

  def index
    render :json => Student.all.to_json
  end
end
