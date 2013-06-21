ActiveAdmin.register Case, :namespace => :parent do
  actions :show, :index

  belongs_to :student

  config.filters = false

  show :title => "Details" do |f|
    render "admin/cases/show", object: f, is_admin: false, url_back: parent_student_cases_path(student_id: f.student)
  end

  index do
    table :class => 'index_table index student', :paginator => false do
      thead do
        tr do
          th "Date"
          th "Status"
          th "Message"
          th "Comment"
          th "Voice Memo"
          th ""
        end
      end
      tbody do
        cases.each do |c|
          render 'admin/cases/index_row', :object => c, :is_admin => false
        end
      end
    end
  end

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
