class EducationalMethod < ActiveRecord::Base

  # Associations
  has_many :activity_forms, dependent: :destroy
  
  # Validations
  validates :name, presence: true
  
end
