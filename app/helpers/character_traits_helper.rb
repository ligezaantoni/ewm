module CharacterTraitsHelper

  def character_trait_kind_options_for_select
    CharacterTrait.kinds.keys.map do |key|
      [I18n.t("enumerations.character_trait.kind.#{key}"), key]
    end
  end

end
