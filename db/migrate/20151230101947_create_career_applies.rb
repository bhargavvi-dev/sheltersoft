class CreateCareerApplies < ActiveRecord::Migration
  def change
    create_table :career_applies do |t|
      t.references :career
      t.string :name
      t.string :email
      t.text :message
      t.timestamps null: false
    end
  end
end
