class DropAbilities < ActiveRecord::Migration
  def change
    drop_table :abilities
    drop_table :abilities_scouts
  end
end
