ActiveAdmin.register Case, :namespace => :admin do
  config.filters = false

  actions :index, :edit, :update, :delete

  index do
    table :class => 'index_table index student', :paginator => false do
      thead do
        tr do
          th ""
          th ""
          th "Date"
          th "Status"
          th "Comment"
          th "Voice Memo"
          th ""
          th ""
        end
      end
      tbody do
        cases.each do |c|
          tr do
            td class: "picture top" do
              img src: c.student.picture.url
            end
            td class: "name double_line" do
              span class: "strong" do
                c.student.full_name
              end
              span class: "blended" do
                "#{c.student.age} #{c.student.city}"
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
            td class: "action_button" do
              link_to("Edit", edit_admin_case_path(c))
            end
            td class: "action_button" do
              link_to("Delete", admin_case_path(c), :method => :delete)
            end
          end
        end
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    div class: "panel" do
      div class: "picture top" do
        img src: f.object.student.picture.url
      end
      div class: "name double_line" do
        span class: "strong" do
          f.object.student.full_name
        end
        span class: "blended" do
          "#{f.object.student.age} #{f.object.student.city}"
        end
      end
      div class: "buttons" do
        f.actions
      end
    end
    f.inputs "General" do
      f.input :student
      f.input :teacher
      f.input :subject
      f.input :class_room
      f.input :severity
      f.input :memo, :as => :file
      f.input :message, :as => :text
    end

    f.actions
  end

end
