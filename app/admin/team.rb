ActiveAdmin.register Team do

  permit_params :name, :position, :description, :avatar
  filter :name
  filter :position
  filter :description

  index do
    selectable_column
    column :name
    column :position
    actions
  end

  show do
    attributes_table do
      row :name
      row :position
      row "Description" do |t|
        t.description.html_safe if t.description.present?
      end
      row "Avatar" do |t|
        image_tag t.avatar.url(:medium) if t.avatar.url.present?
      end
    end
  end

  form multipart: true do |f|
    f.inputs "Team" do
      f.input :name
      f.input :position
      f.input :description, :input_html => { :rows => 3}
      f.input :avatar, :as => :file
    end
    f.actions
  end
end
