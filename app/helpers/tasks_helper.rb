module TasksHelper

  def task_status_options_for_select
    Task.statuses.keys.map do |key|
      [I18n.t("enumerations.task.status.#{key}"), key]
    end
  end
  
end
