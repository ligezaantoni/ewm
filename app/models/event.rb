class Event < ActiveRecord::Base

  # Associations
  belongs_to :team
  has_many :activities
  
end
