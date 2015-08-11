class AddFramedBase64ToPhotoSet < ActiveRecord::Migration
  def change
    add_column :photo_sets, :framed_base64, :text
  end
end
