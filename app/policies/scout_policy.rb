class ScoutPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:team).where('teams.user_id = ?', user.id)
      end
    end
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :id, :team_id, :school_id, :grade, :first_name, :last_name, :pesel, :birthplace, 
          :phone_number, :email, :allergies, :past_diseases, :vaccinations, 
          :rank, :position, :promise_made_on, :patrol, :avatar, character_trait_ids: [], address_attributes: [
            :street_and_number, :postal_code, :city
          ]
        ]
      end
    attributes
  end  
  
  private
  
  def owner?
    record.team.user == user
  end
  
end
