ActiveAdmin.register Case, :namespace => :parent do
  actions :show, :index

  belongs_to :student

  controller do
    before_filter :limit_to_user

    private
    def limit_to_user
      unless params[:student_id].present? and params[:student_id] == current_admin_user.child_id.to_s
        redirect_to root_path
      end
    end
  end
end
