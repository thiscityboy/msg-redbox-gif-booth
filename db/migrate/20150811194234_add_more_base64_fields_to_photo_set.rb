class AddMoreBase64FieldsToPhotoSet < ActiveRecord::Migration
  def change
    add_column :photo_sets, :photo5_base64, :text
    add_column :photo_sets, :photo6_base64, :text
    add_column :photo_sets, :photo7_base64, :text
    add_column :photo_sets, :photo8_base64, :text
  end
end
