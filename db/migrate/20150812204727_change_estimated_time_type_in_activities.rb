class ChangeEstimatedTimeTypeInActivities < ActiveRecord::Migration
  def up
    change_column :activities, :estimated_time, :integer
  end
  
  def down
    change_column :activities, :estimated_time, :time
  end
end
