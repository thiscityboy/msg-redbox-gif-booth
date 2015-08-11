class AddAttachmentPhoto3ToPhotoSets < ActiveRecord::Migration
  def self.up
    change_table :photo_sets do |t|
      t.attachment :photo3
    end
  end

  def self.down
    remove_attachment :photo_sets, :photo3
  end
end
