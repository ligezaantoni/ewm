class AddRelationToTeams < ActiveRecord::Migration
  def change
    create_table :character_traits_teams, id: false do |t|
      t.belongs_to :character_trait, index: true
      t.belongs_to :team, index: true
    end
  end
end
