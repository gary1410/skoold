class GreeterController < ApplicationController
  def index
    if current_admin_user
      if current_admin_user.child_id
        redirect_to parent_student_cases_path current_admin_user.child_id
      else
        redirect_to admin_root_path
      end
    else
      redirect_to new_admin_user_session_path
    end
  end
end
