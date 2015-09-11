class SchoolPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :team_id, :kind, :number, :patron, :activity_room, 
          :equipment_storage, :comments, address_attributes: [
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
