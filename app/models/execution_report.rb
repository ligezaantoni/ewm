class ExecutionReport < ActiveRecord::Base

  # Associations
  belongs_to :activity
  
  # Validations
  validates :activity, presence: true
  
end
