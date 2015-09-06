class TeamPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:user => user)
      end
    end
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :name, :number, :patron, :trial, :region, :kind, :user_id, character_trait_ids: [], address_attributes: [
            :street_and_number, :postal_code, :city
          ]
        ]
      end
    attributes
  end
  
  private
  
  def owner?
    record.user == user
  end
  
end
