class ActivityForm < ActiveRecord::Base

  # Associations
  belongs_to :educational_method
  has_and_belongs_to_many :activities, join_table: "activity_forms_activities"
  
  # Validations
  # validates :educational_method, presence: true
  # validates :name, presence: true
  
end
