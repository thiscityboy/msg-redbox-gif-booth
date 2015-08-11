class AddAttachmentPhoto4ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo4
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo4
  end
end
