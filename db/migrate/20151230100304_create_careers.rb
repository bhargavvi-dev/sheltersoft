class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.integer :job_type      
      t.string :role
      t.string :key_skills
      t.string :location
      t.string :qualifications
      t.text :description
      t.text :responsibilities
      t.text :requirements
      t.text :bonus_points      
      t.timestamps null: false
    end
  end
end
