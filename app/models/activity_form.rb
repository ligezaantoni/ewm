class ActivityForm < ActiveRecord::Base

  # Associations
  belongs_to :educational_method
  has_many :activities
  
  # Validations
  validates :educational_method, presence: true
  validates :name, presence: true
  
end
