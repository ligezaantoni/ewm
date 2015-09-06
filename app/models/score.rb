class Score < ActiveRecord::Base

  # Associations
  belongs_to :scorable, polymorphic: true
  belongs_to :scout
    
end
