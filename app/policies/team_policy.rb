class TeamPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :name, :number, :patron, :trial, :region, :kind, character_trait_ids: [], address_attributes: [
            :street_and_number, :postal_code, :city
          ]
        ]
      end
    attributes
  end
end
