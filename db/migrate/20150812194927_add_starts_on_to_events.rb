class AddStartsOnToEvents < ActiveRecord::Migration
  def up
    add_column :events, :starts_on, :date
    change_column :events, :starts_at, :string
  end
  
  def down
    remove_column :events, :starts_on, :date
    change_column :events, :starts_at, :datetime
  end
end
