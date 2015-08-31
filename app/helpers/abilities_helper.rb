module AbilitiesHelper

  def ability_level_options_for_select
    Ability.levels.keys.map do |key|
      [I18n.t("enumerations.ability.full_level.#{key}"), key]
    end
  end
  
end
