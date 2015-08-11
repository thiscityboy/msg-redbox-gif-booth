class AddAttachmentFramedToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :framed
    end
  end

  def self.down
    remove_attachment :photo_sets, :framed
  end
end
