ActiveAdmin.register AdminUser, :namespace => :admin do
  menu :if => proc { false && current_admin_user.super_user? }

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :super_user
      f.input :child_id, :as => :select, :collection => Student.all.map{ |s| ["#{s.full_name}", s.id] }
    end
    f.inputs "Password" do
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do

    def update
      @admin_user = AdminUser.find(params[:id])
      params[:admin_user].delete_if { |k, v| v.empty? }
      if @admin_user.update_attributes params[:admin_user]
        flash[:notice] = "Admin record updated successfully"
        redirect_to :action => :show
      else
        render 'active_admin/resource/edit.html.arb'
      end
    end
  end
end
