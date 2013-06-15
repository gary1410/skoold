ActiveAdmin.register Student do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "General" do
      f.input :name
      f.input :description
    end

    f.inputs "picture" do
      f.input :picture, :as => :file, :hint => f.object.picture.blank? ?
        f.template.content_tag(:span, "no picture yet!") :
        f.template.image_tag(f.object.picture.url, :class => "stamp_upload")
      f.input :picture_cache, :as => :hidden
    end

    f.actions
  end

end