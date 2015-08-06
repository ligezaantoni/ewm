class ScoutDecorator < Draper::Decorator
  delegate_all
  
  def age_with_unit
    "#{model.age} #{h.t('.age_unit')}"
  end
  
  def full_name
    "#{model.first_name} #{model.last_name}"
  end
  
  def full_name_reversed
    "#{model.last_name}, #{model.first_name}"
  end
  
  def rank
    h.t("enumerations.scout.rank.#{model.rank}")
  end
  
  def position
    h.t("enumerations.scout.position.#{model.position}")
  end
  
  def street_and_number
    model.address.street_and_number if model.address.present?
  end

  def city_with_postal_code
    "#{model.address.postal_code}, #{model.address.city}" if model.address.present?
  end
  
end
