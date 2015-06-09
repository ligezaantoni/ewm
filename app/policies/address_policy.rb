class AddressPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :street_and_number, :postal_code, :city
        ]
      end
    attributes
  end
end
