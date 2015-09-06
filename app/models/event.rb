class Event < ActiveRecord::Base

  # Associations
  belongs_to :team
  has_many :activities
  
  # Validations
  validates :starts_on, presence: true
  validates :starts_at, presence: true
  
  scope :nearest, Proc.new { |after = DateTime.now, limit = 1| where('starts_on > ?', after).order("starts_on ASC").limit(limit) }
  
  def duration
    activities.sum(:estimated_time).minutes
  end
  
end
