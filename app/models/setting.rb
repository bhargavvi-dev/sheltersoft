class Setting < ActiveRecord::Base
  validates :name, presence: true
  validates :label, presence: true
  validates :val, presence: true
  validates_uniqueness_of :label
end


