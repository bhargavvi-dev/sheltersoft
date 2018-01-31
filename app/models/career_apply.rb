class CareerApply < ActiveRecord::Base
  belongs_to :career
  validates :career_id, :name, :email, :message, presence: true

  has_attached_file :resume,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
     environment: ENV["RACK_ENV"],
     path: proc{|style| "#{style}/#{id}_#{resume.original_filename}"}
   }

  validates_attachment :resume,
                       :content_type => { content_type: ["application/pdf", 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'] },
                       :message => "Please upload PDF/Word file only"
end
