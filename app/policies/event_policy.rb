class EventPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:team).where(teams: {user_id: user.id})
      end
    end
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
    
  private
  
  def owner?
    record.team.user == user
  end
  
end
