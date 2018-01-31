ActiveAdmin.register CareerApply do
  menu :priority => 10, parent: 'Career Info'

  filter :career
  filter :name
  filter :email

  permit_params :career_id, :name, :email, :message, :resume

  index do
    selectable_column
    column :career do |c|
      c.career.role
    end
    column :name
    column :email
    actions
  end

  show do
    attributes_table do
      row :career do |c|
        c.career.role
      end
      row :name
      row :email
      row "Message" do |ca|
        ca.message.html_safe
      end
      row :resume do |ca|
        link_to ca.resume.url, ca.resume.url, :target => "_blank"
      end
    end
  end

  form multipart: true do |f|
    f.inputs "CareerApply" do
      f.input :career_id, :as => :select, :collection => Career.all
      f.input :name
      f.input :email
      f.input :message, :input_html => { :rows => 3}
      f.input :resume, :as => :file
    end
    f.actions
  end
end
