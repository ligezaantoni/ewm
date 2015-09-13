class CharacterTraitPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :name, :kind
        ]
      end
    attributes
  end
  
end
