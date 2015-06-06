class CreateExecutionReports < ActiveRecord::Migration
  def change
    create_table :execution_reports do |t|
      t.references :activity, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
