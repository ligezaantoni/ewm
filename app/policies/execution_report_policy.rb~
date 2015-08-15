class ExecutionReportPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def permitted_attributes
    attributes = []
      if user.present?
        attributes += [ 
          :activity_id, :content
        ]
      end
    attributes
  end
end
