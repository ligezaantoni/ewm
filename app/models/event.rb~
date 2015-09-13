class Event < ActiveRecord::Base

  after_create :set_activities

  # Associations
  belongs_to :team
  has_many :activities
  
  # Validations
  validates :starts_on, presence: true
  validates :starts_at, presence: true
  validates :starts_at, format: { with: /[0-9]{1,2}:[0-9]{1,2}/ }
  
  scope :nearest, Proc.new { |after = DateTime.now, limit = 1| where('starts_on > ?', after).order("starts_on ASC").limit(limit) }
  
  def duration
    activities.sum(:estimated_time).minutes
  end
  
  private
  
  def set_activities
    activities.build(name: "Rozpoczęcie", estimated_time: 5)
    activities.build(name: "Gra terenowa", estimated_time: 30, activity_form_ids: [ActivityForm.find_by(name: "gra terenowa").id])
    activities.build(name: "Ognisko", estimated_time: 30, activity_form_ids: [ActivityForm.find_by(name: "ognisko/ kominek").id])
    activities.build(name: "Zakończenie", estimated_time: 5)
  end
  
end
