ActiveAdmin.register Career do
  menu :priority => 11, parent: 'Career Info'

  filter :job_type, :as => :select, :collection => Career.job_type
  filter :role
  filter :key_skills
  filter :location

  permit_params :job_type, :role, :key_skills, :location, :qualifications, :description, :responsibilities,
                :requirements, :bonus_points

  index do
    selectable_column
    column :job_type
    column :role
    column :key_skills
    column :location
    actions
  end

  show do
    attributes_table do
      row :job_type
      row :role
      row :key_skills
      row :location
      row :qualifications
      row "Description" do |c|
        c.description.html_safe
      end
      row :responsibilities
      row :requirements
      row :bonus_points
    end
  end

  form multipart: true do |f|
    f.inputs "Career" do
      f.input :job_type, :as => :select, :collection => Career.job_type
      f.input :role
      f.input :key_skills
      f.input :location
      f.input :qualifications
      f.input :description, :input_html => { :rows => 3}
      f.input :responsibilities, :input_html => { :rows => 3}
      f.input :requirements, :input_html => { :rows => 3}
      f.input :bonus_points, :input_html => { :rows => 3}
    end
    f.actions
  end
end