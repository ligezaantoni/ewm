class ScoutDecorator < Draper::Decorator
  delegate_all
  
  decorates_association :school, :with => SchoolDecorator
  decorates_association :scores, :with => ScoreDecorator
  
  def age_with_unit
    model.age.present? ? "#{model.age} #{h.t('.age_unit')}" : ""
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
    if model.address.present? && model.address.street_and_number.present?
      model.address.street_and_number
    end
  end

  def city_with_postal_code
    if model.address.present? && model.address.city.present?
      [
        model.address.postal_code, 
        model.address.city
      ].reject(&:nil?).join(', ')
    end
  end
  
  def allergies
    model.allergies.present? ? model.allergies : "brak"
  end
  
  def vaccinations
    model.vaccinations.present? ? model.vaccinations : "brak"
  end
  
  def past_diseases
    model.past_diseases.present? ? model.past_diseases : "brak"
  end
  
end
