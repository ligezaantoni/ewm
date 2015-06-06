class CreateActivityForms < ActiveRecord::Migration
  def change
    create_table :activity_forms do |t|
      t.references :educational_method, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
