class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.integer :level, default: 0
      t.text :requirements

      t.timestamps null: false
    end
  end
end
