class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :team, index: true, foreign_key: true
      t.datetime :starts_at
      t.string :place

      t.timestamps null: false
    end
  end
end
