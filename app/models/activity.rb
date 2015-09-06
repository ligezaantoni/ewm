class Activity < ActiveRecord::Base

  # Associations
  belongs_to :event
  has_and_belongs_to_many :activity_forms, join_table: "activity_forms_activities"
  has_one :execution_report, dependent: :destroy
  
  accepts_nested_attributes_for :execution_report
  
  # Validations
  validates :name, presence: true
  validates :estimated_time, presence: true
  
  # Scopes
  scope :ordered, -> { order("position") }
  
end
