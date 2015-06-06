class Address < ActiveRecord::Base

  # Associations
  has_many :scouts
  has_many :teams
  has_many :schools
  
end
