ActiveAdmin.register Student, :namespace => :admin do
  menu :if => proc { false }
  config.filters = false

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Student data" do
      f.input :name
      f.input :description
      f.input :city
      f.input :sex, :as => :select, :include_blank => false, :collection => { 'Boy'=>'m', 'Girl'=>'f' }
    end

    f.inputs "Parent data" do
      f.input :parent_first_name, :label => "First Name"
      f.input :parent_last_name, :label => "Last Name"
      f.input :parent_phone_number, :label => "Phone number"
      f.input :parent_email, :label => "Email address"
    end

    f.inputs "Picture" do
      f.input :picture, :as => :file, :hint => f.object.picture.blank? ?
        f.template.content_tag(:span, "no picture yet!") :
        f.template.image_tag(f.object.picture.url, :class => "stamp_upload")
      f.input :picture_cache, :as => :hidden
    end

    f.actions
  end


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
        end
      end
      tbody do
        Case.find_each do |c|
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
              link_to "View", parent_student_case_path(student_id: c.student, id: c)
            end
          end
        end
      end
    end
  end


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
          th ""
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
            td class: "action_button" do
              link_to "View", parent_student_case_path(student_id: student, id: c)
            end
          end
        end
      end
    end
  end

end