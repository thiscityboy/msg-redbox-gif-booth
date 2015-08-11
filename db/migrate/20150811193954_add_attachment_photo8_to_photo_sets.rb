class AddAttachmentPhoto8ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo8
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo8
  end
end
