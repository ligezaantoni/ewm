class Task < ActiveRecord::Base

  # Associations
  belongs_to :activity_form
  belongs_to :taskable, polymorphic: true
  
  # Validations
  validates :activity_form, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  
  # Enums
  enum status: %i(in_progress accomplished failed)
  
end
