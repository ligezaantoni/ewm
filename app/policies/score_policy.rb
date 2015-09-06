class ScorePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :scout_id, :reason, :number, :scorable_id, :scorable_type
        ]
      end
    attributes
  end
end
