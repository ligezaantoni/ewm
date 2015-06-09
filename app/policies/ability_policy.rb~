class AbilityPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :name, :level, :requirements
        ]
      end
    attributes
  end

end
