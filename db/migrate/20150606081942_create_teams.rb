class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :address, index: true, foreign_key: true
      t.string :name
      t.integer :number
      t.string :patron

      t.timestamps null: false
    end
  end
end
