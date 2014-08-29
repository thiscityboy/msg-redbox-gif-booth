class AddAttachmentFramedToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :framed
    end
  end

  def self.down
    remove_attachment :photos, :framed
  end
end
