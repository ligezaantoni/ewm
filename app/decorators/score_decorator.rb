class ScoreDecorator < Draper::Decorator
  delegate_all
  
  def reason
    if model.reason.present?
      model.reason
    elsif model.scorable.present?
      "#{model.scorable.activity_form.name}"
    else
      "brak"
    end
  end
  
end
