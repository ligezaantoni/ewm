class ChangeAssociationsInTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.remove :scout_id, :integer
      t.integer :taskable_id
      t.string :taskable_type
      add_index :tasks, [:taskable_type, :taskable_id]
    end
  end
end
