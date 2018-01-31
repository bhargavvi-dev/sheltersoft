ActiveAdmin.register Setting do
  menu :priority => 9, parent: 'Settings' 
  permit_params :name, :val, :label
  
  filter :name
  filter :label
  filter :val  
  filter :created_at

  index do
    selectable_column
    column :name
    column :label
    column :val    
    actions
  end

  form do |f|
    f.inputs "Setting" do
      f.input :name
      f.input :label
      f.input :val      
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :label
      row :val      
    end
  end

end