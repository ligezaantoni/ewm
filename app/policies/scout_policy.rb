class ScoutPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
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
end
