class AddAttachmentPhoto2ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo2
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo2
  end
end
