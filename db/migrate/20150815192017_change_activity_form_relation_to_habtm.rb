class ChangeActivityFormRelationToHabtm < ActiveRecord::Migration
  def change
    create_table :activity_forms_activities, id: false do |t|
      t.belongs_to :activity_form, index: true
      t.belongs_to :activity, index: true
    end
    remove_column :activities, :activity_form_id, :date
  end
end
