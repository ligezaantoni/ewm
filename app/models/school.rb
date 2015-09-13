class School < ActiveRecord::Base

  # Associations
  belongs_to :team
  has_one :address, as: :addressable, dependent: :destroy
  has_many :officials, as: :relatable, class_name: "RelatedPerson", dependent: :destroy
  has_many :scouts
  
  accepts_nested_attributes_for :address
  
  # Validations
  validates :number, presence: true
  
  # Enums
  enum kind: %i(primary_school secondary_school high_school)
  
end
