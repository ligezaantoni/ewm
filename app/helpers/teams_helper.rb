module TeamsHelper

  def kind_options_for_select
    Team.kinds.keys.map do |key|
      [I18n.t("enumerations.team.kind.#{key}"), key]
    end
  end

end
