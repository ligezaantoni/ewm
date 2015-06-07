class Address < ActiveRecord::Base

  # Associations
  has_many :scouts
  has_many :teams
  has_many :schools
  
  # Validations
  validates :street_and_number, presence: true
  validates :city, presence: true
  
end
