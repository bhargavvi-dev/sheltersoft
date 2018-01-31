class AddAttachements < ActiveRecord::Migration
  def change
  	add_attachment :career_applies, :resume
  	add_attachment :teams, :avatar
  	add_attachment :projects, :avatar
  end
end