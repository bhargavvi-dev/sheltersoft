ActiveAdmin.register Project do

  permit_params :name, :url, :description, :technologies, :avatar

  filter :name
  filter :technologies
  filter :description
  
  index do
    selectable_column
    column :name
    column :url
    column :technologies
    actions
  end

  show do
    attributes_table do
      row :name
      row :url
      row "Description" do |p|
        p.description.html_safe
      end
      row :technologies
      row "Avatar" do |p|
        image_tag p.avatar.url(:medium)
      end
    end
  end

  form multipart: true do |f|
    f.inputs "Project" do
      f.input :name
      f.input :url
      f.input :description, :input_html => { :rows => 3}
      f.input :technologies
      f.input :avatar, :as => :file
    end
    f.actions
  end
end
