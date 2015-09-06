class ActivityFormPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :educational_method_id, :description, :name
        ]
      end
    attributes
  end
end
