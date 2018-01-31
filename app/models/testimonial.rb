class Testimonial < ActiveRecord::Base
  validates :client_name, :client_position, :description, presence: true

  has_attached_file :avatar,
    :styles => { small: "100x100>", medium: "300x300>" }, 
    :default_url => "noimage.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
    :environment => ENV["RACK_ENV"],
    :path => proc{|style| "#{style}/#{id}_#{avatar.original_filename}"}
   }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/	
end
