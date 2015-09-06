class ActivityPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :id, :event_id, :name, :description, :estimated_time, :position,
          activity_form_ids: [],
          :execution_report_attributes => [:content]
        ]
      end
    attributes
  end
  
  def sort_order?
    manage?
  end
end
