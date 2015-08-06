class ChangeAgeToPeselInScouts < ActiveRecord::Migration
  def change
    change_table :scouts do |t|
      t.remove :age
      t.string :pesel
    end
  end
end
