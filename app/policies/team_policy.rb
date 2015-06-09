class TeamPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :address_id, :name, :number, :patron
        ]
      end
    attributes
  end
end
