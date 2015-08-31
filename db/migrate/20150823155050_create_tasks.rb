class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :activity_form, index: true, foreign_key: true
      t.references :scout, index: true, foreign_key: true
      t.date :deadline
      t.text :description
      t.integer :status
    end
  end
end
