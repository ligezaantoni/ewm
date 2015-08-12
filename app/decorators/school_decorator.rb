class SchoolDecorator < Draper::Decorator
  delegate_all
  
  decorates_association :officials, :with => RelatedPersonDecorator
  
  def full_name
    <<-fullname
      #{kind}
      #{number}
      #{patron},
      #{model.address.city}
    fullname
  end
  
  def short_name
    "#{short_kind} #{model.number}"
  end
  
  def short_kind
    h.t("enumerations.school.short_kind.#{model.kind}")
  end
  
  def number
    "#{h.t(".number_prefix")} #{model.number}"
  end
  
  def patron
    "#{h.t(".patron_prefix")} #{model.patron}" if model.patron.present?
  end
  
  def kind
    h.t("enumerations.school.kind.#{model.kind}")
  end
  
  def activity_room
    model.activity_room? ? h.t(".possession_value.true") : h.t(".possession_value.false")
  end
  
  def equipment_storage
    model.equipment_storage? ? h.t(".possession_value.true") : h.t(".possession_value.false")
  end
  
  def comments
    model.comments.present? ? model.comments : h.t(".possession_value.false")
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
