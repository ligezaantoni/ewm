class RelatedPerson < ActiveRecord::Base

  # Associations
  belongs_to :relatable, polymorphic: true
  
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}/ }, 
    allow_blank: true
  
  # Enums
  enum role: %i(educator father mother school_principal school_representative)
  
end
