class ActivityForm < ActiveRecord::Base

  # Associations
  belongs_to :educational_method
  has_and_belongs_to_many :activities, join_table: "activity_forms_activities"
  has_and_belongs_to_many :character_traits, join_table: "activity_forms_traits"
  has_many :tasks, dependent: :destroy
  
  # Validations
   validates :name, presence: true
   validates :name, uniqueness: true
  
end
