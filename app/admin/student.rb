ActiveAdmin.register Student do
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

end