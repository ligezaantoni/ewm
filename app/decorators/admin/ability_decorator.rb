module Admin
  class AbilityDecorator < Draper::Decorator
    delegate_all
    
    def name_with_level
      "#{model.name} (#{level})"
    end
    
    def level
      h.t("enumerations.ability.level.#{model.level}")
    end

  end
end
