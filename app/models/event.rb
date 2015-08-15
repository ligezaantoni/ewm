class Event < ActiveRecord::Base

  # Associations
  belongs_to :team
  has_many :activities
  
  # Validations
  validates :starts_at, presence: true
  
  def duration
    activities.sum(:estimated_time).minutes
  end
  
end
