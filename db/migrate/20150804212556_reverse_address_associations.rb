class ReverseAddressAssociations < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      add_index :addresses, [:addressable_type, :addressable_id]
    end
    change_table :scouts do |t|
      t.remove :address_id
    end
    change_table :schools do |t|
      t.remove :address_id
    end
    change_table :teams do |t|
      t.remove :address_id
    end
  end
end
