module ActivitiesHelper

  def activity_form_options_for_select
    policy_scope(ActivityForm.all).map do |af|
      [af.name, af.id]
    end
  end
  
end
