class EducationalMethod < ActiveRecord::Base

  # Associations
  has_many :activity_forms
  
  # Validations
  validates :name, presence: true
  
end
