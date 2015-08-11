class AddAttachmentGifToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :gif
    end
  end

  def self.down
    remove_attachment :photo_sets, :gif
  end
end
