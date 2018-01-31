class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :val
      t.string :label

      t.timestamps null: false
    end
  end
end
