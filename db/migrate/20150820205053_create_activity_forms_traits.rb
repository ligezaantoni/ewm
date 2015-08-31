class CreateActivityFormsTraits < ActiveRecord::Migration
  def change
    create_table :activity_forms_traits, id: false do |t|
      t.belongs_to :activity_form, index: true
      t.belongs_to :character_trait, index: true
    end
    drop_table :methods_traits do |t|
      t.belongs_to :educational_method, index: true
      t.belongs_to :character_trait, index: true
    end
  end
end
