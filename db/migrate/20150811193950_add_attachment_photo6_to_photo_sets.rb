class AddAttachmentPhoto6ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo6
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo6
  end
end
