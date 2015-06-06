class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.references :address, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.string :name
      t.integer :number
      t.string :patron
      t.boolean :activity_room
      t.boolean :equipment_storage
      t.text :comments

      t.timestamps null: false
    end
  end
end
