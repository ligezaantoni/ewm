class AddAttachmentAvatarToScouts < ActiveRecord::Migration
  def self.up
    change_table :scouts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :scouts, :avatar
  end
end
