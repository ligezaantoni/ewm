class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :event, index: true, foreign_key: true
      t.references :activity_form, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
