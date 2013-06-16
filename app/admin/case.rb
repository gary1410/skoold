ActiveAdmin.register Case do

  form :html => { :enctype => "multipart/form-data" } do |f|
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
