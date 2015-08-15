class ActivityDecorator < Draper::Decorator
  delegate_all
  
  def execution_report_content
    model.execution_report.content
  end
  
end
