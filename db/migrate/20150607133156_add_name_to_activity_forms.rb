class AddNameToActivityForms < ActiveRecord::Migration
  def change
    add_column :activity_forms, :name, :string
  end
end
