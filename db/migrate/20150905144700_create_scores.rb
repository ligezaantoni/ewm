class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :scout, index: true, foreign_key: true
      t.integer :number
      t.string :reason
      t.integer :scorable_id
      t.string :scorable_type
    end
    add_index :scores, [:scorable_type, :scorable_id]
  end
end
