class ActivityPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :id, :event_id, :activity_form_id, :name, :description, :estimated_time, 
          activity_form_ids: [],
          :execution_report_attributes => [:content]
        ]
      end
    attributes
  end
end
