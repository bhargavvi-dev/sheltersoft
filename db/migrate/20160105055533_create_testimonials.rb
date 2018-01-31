class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :client_name
      t.string :client_position
      t.text :description
      t.attachment :avatar
      t.timestamps null: false
    end
  end
end
