ActiveAdmin.register StaticPage do
  menu :priority => 9, parent: 'Settings' 

  permit_params :name, :content, :page_route, :label
  
  filter :name
  filter :label
  filter :created_at

  index do
    selectable_column
    column :name
    column :label
    actions
  end

  show do
    attributes_table do
      row :name
      row "content" do |c|
        c.content.html_safe if c.content.present?
      end
      row :label
    end
  end

  form do |f|
    f.inputs "StaticPage" do
      f.input :name
      if f.object.new_record?
        f.input :label
      end      
      f.input :content, :as => :ckeditor ,:input_html => { :class => "ckeditor" }
    end
    f.actions
  end
  
end
