class CasesSerializer < ActiveModel::Serializer
  include ApplicationHelper

  attributes :status, :cases

  def status
    "success"
  end

  def cases
    ActiveSupport::JSON.decode json_for(object, :serialize => CaseSerializer)
  end
end
