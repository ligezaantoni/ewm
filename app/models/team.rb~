class Team < ActiveRecord::Base

  # Associations
  belongs_to :address
  has_many :scouts
  has_many :schools
  has_many :events
  
  # Validations
  validates :name, presence: true
  validates :number, presence: true
  
  # Enums
  enum kind: %i(scout cub_scout wanderer)
  
end
