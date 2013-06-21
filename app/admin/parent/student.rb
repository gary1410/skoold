ActiveAdmin.register Student, :namespace => :parent, :name => "Student" do
  actions :show, :index

  controller do
    before_filter :limit_to_user
    private
    def limit_to_user
      unless params[:id].present? and params[:id] == current_admin_user.child_id.to_s
        if params[:id].present? and params[:action] == :index
          redirect_to
        else
          redirect_to root_path
        end
      end
    end
  end

end