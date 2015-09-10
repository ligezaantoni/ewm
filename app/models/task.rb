class Task < ActiveRecord::Base

  after_save :set_score
  before_save :default_values

  # Associations
  belongs_to :activity_form
  belongs_to :taskable, polymorphic: true
  has_one :score, as: :scorable, dependent: :destroy
  
  # Validations
  validates :activity_form, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  
  # Enums
  enum status: %i(in_progress accomplished failed)
  
  def set_score
    if accomplished? && score.nil? && taskable_type == "Scout"
      build_score(scout_id: taskable_id, number: points, scorable_id: id, scorable_type: self.class.name)
      save
    elsif in_progress? && score.present? && taskable_type == "Scout"
      score.destroy
    end
  end
  
  def default_values
    self.points ||= 0
  end
  
end
