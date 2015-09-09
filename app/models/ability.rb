class Ability < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :scouts
  
  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
  
  # Enums
  enum level: %i(not_classified one_star two_stars three_stars master)
  
end
