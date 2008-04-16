class Form < ActiveRecord::Base
  belongs_to :disease
  belongs_to :jurisdiction
  
  has_many :sections, :order => :position
  
  validates_presence_of :disease
  validates_presence_of :jurisdiction
end
