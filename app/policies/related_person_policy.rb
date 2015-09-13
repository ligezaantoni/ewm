class RelatedPersonPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :first_name, :last_name, :phone_number, :email, :role, :relatable_id, :relatable_type
        ]
      end
    attributes
  end
    
  private
  
  def owner?
    record.relatable.team.user == user
  end
  
end
