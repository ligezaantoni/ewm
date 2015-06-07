class Activity < ActiveRecord::Base

  # Associations
  belongs_to :event
  belongs_to :activity_form
  has_one :execution_reports
  
  # Validations
  validates :event, presence: true
  validates :name, presence: true
  validates :estimated_time, presence: true
  
end
