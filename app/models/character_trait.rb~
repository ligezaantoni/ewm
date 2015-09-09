class CharacterTrait < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :activity_forms, join_table: "activity_forms_traits"
  has_and_belongs_to_many :scouts
  has_and_belongs_to_many :teams
  
  # Validations
  validates :name, presence: true
  
  # Enums
  enum kind: %i(neutral strength weakness opportunity threat)
end
