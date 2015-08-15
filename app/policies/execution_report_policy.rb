class ExecutionReportPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :id, :activity_id, :content
        ]
      end
    attributes
  end
end
