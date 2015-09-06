class TeamDecorator < Draper::Decorator
  delegate_all
  
  def full_name
    <<-fullname
      #{model.number}
      #{trial}
      #{model.region}
      #{kind}
      \"#{model.name}\" 
      #{patron}
    fullname
  end
  
  def patron
    "#{h.t(".patron_prefix")} #{model.patron}" if model.patron.present?
  end
  
  def short_name
    <<-shortname
      #{model.number}
      #{trial[0] if trial}#{model.region[0] if model.region}#{kind.gsub(/[^A-Z]/, '') if kind}
      \"#{model.name}\"
    shortname
  end
  
  def short_name_with_patron
    "#{short_name} #{patron}"
  end
  
  def kind
    h.t("enumerations.team.kind.#{model.kind}")
  end
  
  def trial
    model.trial ? h.t("activerecord.attributes.team.trial") : nil
  end
  
  def address
    if model.address.present?
      [
        model.address.postal_code, 
        model.address.city, 
        model.address.street_and_number
      ].reject(&:nil?).join(', ')
    end
  end
  
end
