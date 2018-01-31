class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:owner, :user]

  validates_presence_of :email
  
  after_initialize :init

  scope :active, -> {where(:is_active => true)}

  def full_name
    unless (self.first_name.nil? || self.last_name.nil?)
      "#{self.first_name.capitalize} #{self.last_name.capitalize}"
    else
      "???? ????"
    end
  end

  def init
    self.token = "#{SecureRandom.hex(10)}" unless self.token.present?
  end

end
