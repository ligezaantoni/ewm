class CreateEducationalMethods < ActiveRecord::Migration
  def change
    create_table :educational_methods do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
