class CharacterTrait < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :educational_methods, join_table: "methods_traits"
  has_and_belongs_to_many :scouts
  
  # Validations
  validates :name, presence: true
  
  # Enums
  enum kind: %i(neutral strength weakness)
end
