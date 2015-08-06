class ScoutPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :team_id, :first_name, :last_name, :pesel, :birthplace, 
          :phone_number, :email, :allergies, :past_diseases, :vaccinations, 
          :rank, :position, :promise_made_on, :patrol, address_attributes: [
            :street_and_number, :postal_code, :city
          ]
        ]
      end
    attributes
  end  
end
