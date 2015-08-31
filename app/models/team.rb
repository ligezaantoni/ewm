class Team < ActiveRecord::Base

  # Associations
  has_one :address, as: :addressable, dependent: :destroy
  has_many :scouts
  has_many :schools
  has_many :events
  has_and_belongs_to_many :character_traits
  has_many :goals, as: :taskable, class_name: "Task"
  
  accepts_nested_attributes_for :address
  
  # Validations
  validates :name, presence: true
  validates :number, presence: true
  
  # Enums
  enum kind: %i(scout cub_scout wanderer)
  
end
