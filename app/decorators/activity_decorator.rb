class ActivityDecorator < Draper::Decorator
  delegate_all
  
  def execution_report_content
    model.execution_report.content if model.execution_report.present? && model.execution_report.content.present?
  end
  
end
