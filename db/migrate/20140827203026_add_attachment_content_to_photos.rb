class AddAttachmentContentToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :content
    end
  end

  def self.down
    remove_attachment :photos, :content
  end
end
