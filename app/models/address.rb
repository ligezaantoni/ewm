class Address < ActiveRecord::Base

  # Associations
  belongs_to :addressable, polymorphic: true
  
  # Validations
  validates :postal_code, format: { with: /[0-9]{2}-[0-9]{3}/ }, allow_blank: true
    
end
