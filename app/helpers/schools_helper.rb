module SchoolsHelper

  def school_kind_options_for_select
    School.kinds.keys.map do |key|
      [I18n.t("enumerations.school.kind.#{key}"), key]
    end
  end
  
end
