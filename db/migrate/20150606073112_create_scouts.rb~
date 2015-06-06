class CreateScouts < ActiveRecord::Migration
  def change
    create_table :scouts do |t|
      t.references :team, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :birthplace
      t.string :phone_number
      t.string :email
      t.text :allergies
      t.text :past_diseases
      t.text :vaccinations
      t.integer :rank
      t.integer :position
      t.date :promise_made_on
      t.string :patrol

      t.timestamps null: false
    end
  end
end
