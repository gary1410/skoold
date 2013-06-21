ActiveAdmin.register Student, :namespace => :parent, :name => "Student" do
  actions :show, :index

  show do
    table :class => 'index_table index student', :paginator => false do
      thead do
        tr do
          th ""
          th ""
          th "Date"
          th "Status"
          th "Comment"
          th "Voice Memo"
          #th ""
        end
      end
      tbody do
        student.cases.each do |c|
          tr do
            td class: "picture top" do
              img src: student.picture.url
            end
            td class: "name double_line" do
              span class: "strong" do
                student.full_name
              end
              span class: "blended" do
              "#{student.age} #{student.city}"
              end
            end
            td class: "date" do
              c.date
            end
            td class: "status" do
              c.status
            end
            td class: "comment" do
              input type: "checkbox", checked: c.message.strip.size > 0 ? "checked" : "false", disabled: "true"
            end
            td class: "voice_memo" do
              if c.memo.present?
                input type: "checkbox", disabled: "true", checked: "checked"
              else
                input type: "checkbox", disabled: "true"
              end
            end
          end
        end
      end
    end
  end

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