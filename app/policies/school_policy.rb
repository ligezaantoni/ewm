class SchoolPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :address_id, :team_id, :name, :number, :patron, :activity_room, :equipment_storage, :comments
        ]
      end
    attributes
  end
end
