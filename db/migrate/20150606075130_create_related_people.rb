class CreateRelatedPeople < ActiveRecord::Migration
  def change
    create_table :related_people do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.integer :role, default: 0

      t.timestamps null: false
    end
  end
end
