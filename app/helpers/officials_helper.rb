module OfficialsHelper

  def official_role_options_for_select
    RelatedPerson.roles.slice(:school_principal, :school_representative).keys.map do |key|
      [I18n.t("enumerations.related_person.role.#{key}"), key]
    end
  end
  
end
