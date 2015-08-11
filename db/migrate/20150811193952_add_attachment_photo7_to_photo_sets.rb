class AddAttachmentPhoto7ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo7
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo7
  end
end
