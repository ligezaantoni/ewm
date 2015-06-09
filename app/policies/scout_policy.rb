class ScoutPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :team_id, :address_id, :first_name, :last_name, :age, :birthplace, 
          :phone_number, :email, :allergies, :past_diseases, :vaccinations, 
          :rank, :position, :promise_made_on, :patrol
        ]
      end
    attributes
  end  
end
