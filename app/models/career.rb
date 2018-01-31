class Career < ActiveRecord::Base
  validates :role, :job_type,  :description, :requirements, :location, presence: true
  has_many :career_applies
  
  enum job_type: [:ROR, :iPhone , :Android]

  def self.job_type
    [:ROR, :iPhone , :Android]
  end

end
