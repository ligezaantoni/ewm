class ProfilePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :id, :user_id, :first_name, :last_name, :pesel, :phone_number, address_attributes: [
            :street_and_number, :postal_code, :city
          ]
        ]
      end
    attributes
  end
  
  def owner?
    record.user == user
  end
  
end
