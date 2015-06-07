class AddDetailsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :region, :string
    add_column :teams, :kind, :integer, default: 0
    add_column :teams, :trial, :boolean
  end
end
