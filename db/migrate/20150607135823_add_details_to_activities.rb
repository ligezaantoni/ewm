class AddDetailsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :name, :string
    add_column :activities, :estimated_time, :time
  end
end
