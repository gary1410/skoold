ActiveAdmin.register AdminUser do     
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
    end
    f.inputs "Password" do
      f.input :password
      f.input :password_confirmation
    end
    f.actions                         
  end

  controller do
    def update
      #render 'active_admin/resource/edit.html.arb'
      #redirect_to {:action => :show}, {:notice => "Admin record updated successfully"}
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
