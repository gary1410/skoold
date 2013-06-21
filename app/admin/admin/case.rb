ActiveAdmin.register Case, :namespace => :admin do
  config.filters = false

  actions :index, :show, :update, :delete

  index do
    table :class => 'index_table index student', :paginator => false do
      thead do
        tr do
          th ""
          th ""
          th "Date"
          th "Status"
          th "Message"
          th "Comment"
          th "Voice Memo"
          th ""
          th ""
        end
      end
      tbody do
        cases.each do |c|
          render 'admin/cases/index_row', :object => c, is_admin: true
        end
      end
    end
  end

  show do |f|
    render "admin/cases/show", object: f, is_admin: true, url_back: admin_cases_path(student_id: f.student)
  end

end
