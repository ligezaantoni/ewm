class ScoreDecorator < Draper::Decorator
  delegate_all
  
  def reason
    model.reason.present? ? model.reason : "#{model.scorable.activity_form.name}"
  end
  
end
