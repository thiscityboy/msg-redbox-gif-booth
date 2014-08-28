class AddAttachmentContentToFrames < ActiveRecord::Migration
  def self.up
    change_table :frames do |t|
      t.attachment :content
    end
  end

  def self.down
    remove_attachment :frames, :content
  end
end
