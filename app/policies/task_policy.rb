class TaskPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :activity_form_id, :status, :description, :deadline, :taskable_id, :taskable_type, :points
        ]
      end
    attributes
  end
end
