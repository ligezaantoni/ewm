module ScoutsHelper

  def rank_options_for_select
    Scout.ranks.keys.map do |key|
      [I18n.t("enumerations.scout.rank.#{key}"), key]
    end
  end
  
  def position_options_for_select
    Scout.positions.keys.map do |key|
      [I18n.t("enumerations.scout.position.#{key}"), key]
    end
  end
  
  def scout_school_collection(scout)
    PaginatingDecorator.decorate(scout.team.schools, with: SchoolDecorator)
  end
  
end
