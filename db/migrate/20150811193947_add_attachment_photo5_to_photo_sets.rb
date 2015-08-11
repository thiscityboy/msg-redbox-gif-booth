class AddAttachmentPhoto5ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo5
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo5
  end
end
