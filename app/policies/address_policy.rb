class AddressPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :street_and_number, :postal_code, :city
        ]
      end
    attributes
  end
    
  private
  
  def owner?
    addresable_user = case record.addressable_type
    when "Profile"
      record.addressable.user
    when "School", "Scout"
      record.addressable.team.user
    when "Team"
      record.addressable.user
    end

    addressable_user == user
  end
  
end
