class AddSchoolToScouts < ActiveRecord::Migration
  def change
    add_reference :scouts, :school, index: true, foreign_key: true
    add_column :scouts, :grade, :string
  end
end
