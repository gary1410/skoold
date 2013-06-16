class CaseHistory < ActiveRecord::Base
  attr_accessible :status, :case_id, :admin_user_id
  belongs_to :case
  belongs_to :admin_user
end
