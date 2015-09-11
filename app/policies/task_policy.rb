class TaskPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:team).where(teams: {user_id: user.id}) + 
        scope.joins(:scout).where(scouts: {team_id: Team.where(user_id: user.id)})
      end
    end
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :activity_form_id, :status, :description, :deadline, :taskable_id, :taskable_type, :points
        ]
      end
    attributes
  end
    
  private
  
  def owner?
    if record.taskable_type == "Team"
      record.taskable.user == user
    elsif record.taskable_type == "Scout"
      record.taskable.team.user == user
    end
  end
  
end
