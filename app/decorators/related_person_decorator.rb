class RelatedPersonDecorator < Draper::Decorator
  delegate_all

  def full_name_with_role
    "#{full_name_reversed} (#{role})"
  end
  
  def full_name_reversed
    "#{model.last_name} #{model.first_name}"
  end
  
  def role
    h.t("enumerations.related_person.role.#{model.role}")
  end

end
