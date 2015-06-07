class Event < ActiveRecord::Base

  # Associations
  belongs_to :team
  has_many :activities
  
  # Validations
  validates :starts_at, presence: true
  
end
