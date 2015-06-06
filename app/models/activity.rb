class Activity < ActiveRecord::Base

  # Associations
  belongs_to :event
  belongs_to :activity_form
  has_many :execution_reports
  
end
