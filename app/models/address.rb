class Address < ActiveRecord::Base

  # Associations
  belongs_to :addressable, polymorphic: true
  
  # Validations
  # validates :street_and_number, presence: true
  # validates :city, presence: true
    
end
