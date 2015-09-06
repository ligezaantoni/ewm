class TaskDecorator < Draper::Decorator
  delegate_all
  
  def deadline
    model.deadline.strftime("%d.%m.%Y")
  end
  
  def activity_form_name
    model.activity_form.name
  end
    
  def status
    h.t("enumerations.task.status.#{model.status}")
  end
  
  def taskable_name
    if model.taskable_type == "Scout"
      "#{model.taskable.first_name} #{model.taskable.last_name}"
    else
      model.taskable.name
    end
  end
  
end
