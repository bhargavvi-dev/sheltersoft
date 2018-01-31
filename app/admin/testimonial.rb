ActiveAdmin.register Testimonial do

  permit_params :client_name, :client_position, :description, :avatar
  filter :client_name
  filter :client_position

  index do
    selectable_column
    column :client_name
    column :client_position
    actions
  end

  show do
    attributes_table do
      row :client_name
      row :client_position
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
      f.input :client_name
      f.input :client_position
      f.input :description, :input_html => { :rows => 3}
      f.input :avatar, :as => :file
    end
    f.actions
  end
end
