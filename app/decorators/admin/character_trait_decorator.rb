module Admin
  class CharacterTraitDecorator < Draper::Decorator
    delegate_all
    
    def kind
      h.t("enumerations.character_trait.kind.#{model.kind}")
    end
    
  end
end
