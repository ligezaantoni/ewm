class EventDecorator < Draper::Decorator
  delegate_all
  
  decorates_association :team, :with => TeamDecorator
  
  def team_name
    model.team.name
  end
  
  def starts_on
    model.starts_on.strftime("%d.%m.%Y")
  end
  
  def start_time
    "#{model.starts_on.to_s} #{model.starts_at}".to_time.
    strftime("%d.%m.%Y #{h.t('.hour')} %k:%M")
  end
end
