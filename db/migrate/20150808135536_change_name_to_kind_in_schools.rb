class ChangeNameToKindInSchools < ActiveRecord::Migration
  def change
    change_table :schools do |t|
      t.remove :name, :string
      t.integer :kind
    end
  end
end
