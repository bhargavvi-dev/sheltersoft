ActiveAdmin.register Inquiry do

  permit_params :name, :email, :skype_id, :phone, :message

  filter :name
  filter :email
  filter :skype_id
  filter :phone
  filter :message

  index do
    selectable_column
    column :name
    column :email
    column :skype_id
    column :phone
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :skype_id
      row :phone
      row "Message" do |i|
        i.message.html_safe
      end
    end
  end

  form multipart: true do |f|
    f.inputs "Inquiry" do
      f.input :name
      f.input :email
      f.input :skype_id
      f.input :phone
      f.input :message, :input_html => { :rows => 3}
    end
    f.actions
  end
end
