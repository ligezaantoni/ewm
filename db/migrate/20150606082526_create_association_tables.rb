class CreateAssociationTables < ActiveRecord::Migration
  def change
    create_table :methods_traits, id: false do |t|
      t.belongs_to :educational_method, index: true
      t.belongs_to :character_trait, index: true
    end
    create_table :character_traits_scouts, id: false do |t|
      t.belongs_to :character_trait, index: true
      t.belongs_to :scout, index: true
    end
    create_table :abilities_scouts, id: false do |t|
      t.belongs_to :ability, index: true
      t.belongs_to :scout, index: true
    end
    create_table :scouts_parents, id: false do |t|
      t.belongs_to :scout, index: true
      t.belongs_to :parent, index: true
    end
    create_table :schools_officials, id: false do |t|
      t.belongs_to :school, index: true
      t.belongs_to :official, index: true
    end
  end
end
