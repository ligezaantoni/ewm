class RelatedPersonPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :first_name, :last_name, :phone_number, :email, :role
        ]
      end
    attributes
  end
end
