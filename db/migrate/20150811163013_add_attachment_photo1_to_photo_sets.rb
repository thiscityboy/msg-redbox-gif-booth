class AddAttachmentPhoto1ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo1
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo1
  end
end
