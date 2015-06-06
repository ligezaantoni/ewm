class ActivityForm < ActiveRecord::Base

  # Associations
  belongs_to :educational_method
  has_many :activities
  
end
