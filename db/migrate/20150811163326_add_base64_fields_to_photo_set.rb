class AddBase64FieldsToPhotoSet < ActiveRecord::Migration
  def change
    add_column :photo_sets, :photo1_base64, :text
    add_column :photo_sets, :photo2_base64, :text
    add_column :photo_sets, :photo3_base64, :text
    add_column :photo_sets, :photo4_base64, :text
  end
end
