class StaticPage < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true
  validates :label, :presence => true
  validates_uniqueness_of :label
end
