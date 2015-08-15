class EventPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :team_id, :starts_at, :starts_on, :place
        ]
      end
    attributes
  end
end
