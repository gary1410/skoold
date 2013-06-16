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
              if c.message.present?
                input type: "checkbox", checked: "checked", disabled: "true"
              else
                input type: "checkbox", disabled: "true"
              end
            end
            td class: "voice_memo" do
              if c.memo.present?
                input type: "checkbox", disabled: "true", checked: "checked"
              else
                input type: "checkbox", disabled: "true"
              end
            end
            td class: "action_button" do
              link_to("Edit", admin_case_path(c))
            end
            td class: "action_button" do
              link_to("Delete", admin_case_path(c), :method => :delete)
            end
          end
        end
      end
    end
  end

  show do |f|
    div class: 'panel' do
      div class: 'card' do
        div class: 'picture' do
          img src: f.student.picture.url
        end
        div class: 'name' do
          span class: 'strong' do
            f.student.full_name
          end
          span class: 'blended' do
            "#{f.student.age} #{f.student.city}"
          end
        end
        div class: 'buttons' do
          input class:'edit', type:'button', id: 'edit', value: 'Save'
          input class:'delete', type:'button', id: 'delete', value: 'Delete'
        end
      end
      div class: 'rows' do
        div class: 'row' do
            div class: 'wrapper' do
            span class: 'left strong' do
              "Date"
            end
            span class: 'right' do
              f.date
            end
          end
        end
        div class: 'row' do
          div class: 'wrapper' do
            span class: 'left strong' do
              "Teacher"
            end
            span class: 'right' do
              f.teacher.short_name
            end
          end
        end
        div class: 'row' do
          div class: 'wrapper' do
            span class: 'left strong' do
              "Status"
            end
            span class: 'right' do
              ("<select class='status'><option value='open'"+
                (f.status == 'open' ? " selected='selected'" : "")+
                ">Open</option><option value='processing'"+
                (f.status == 'processing' ? " selected='selected'" : "")+
                ">Processing</option><option value='closed'"+
                (f.status == 'closed' ? " selected='selected'" : "")+">Closed</option></select>").html_safe
            end
          end
        end
      end
      div class: 'comment_row' do
        span do
          "Comment"
        end
        textarea name: "case_history['comment']"
        input class:'add_comment', type: 'button', value: 'Add comment'
      end
      div class: 'voice_memo' do
        span do
          'Voice memo'
        end
        div do
          span do
            'Play voice memo'
          end
          input type: 'button', value: "&#9654;".html_safe
        end
      end
    end
  end
  #
  #form :html => { :enctype => "multipart/form-data" } do |f|
  #  div class: "panel" do
  #    div class: "picture top" do
  #      img src: f.object.student.picture.url
  #    end
  #    div class: "name double_line" do
  #      span class: "strong" do
  #        f.object.student.full_name
  #      end
  #      span class: "blended" do
  #        "#{f.object.student.age} #{f.object.student.city}"
  #      end
  #    end
  #    div class: "buttons" do
  #      f.button(:submit)
  #    end
  #    f.inputs "General" do
  #      f.input :student
  #      f.input :teacher
  #      f.input :subject
  #      f.input :class_room
  #      f.input :severity
  #      f.input :memo, :as => :file
  #      f.input :message, :as => :text
  #    end
  #  end
  #end

end
