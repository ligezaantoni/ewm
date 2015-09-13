class EducationalMethodPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :id, :name
        ]
      end
    attributes
  end
    
end
