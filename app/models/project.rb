class Project < ActiveRecord::Base
  validates :name, :url, :technologies, presence: true
  validates_uniqueness_of :url

  has_attached_file :avatar,
    :styles => { small: "100x100>", medium: "650x350>" }, 
    :default_url => "noimage.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
    :environment => ENV["RACK_ENV"],
    :path => proc{|style| "#{style}/#{id}_#{avatar.original_filename}"}
   }
   
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end