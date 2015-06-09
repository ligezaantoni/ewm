class ActivityPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :event_id, :activity_form_id, :name, :description, :estimate_time
        ]
      end
    attributes
  end
end
