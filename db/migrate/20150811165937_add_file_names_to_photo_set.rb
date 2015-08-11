class AddFileNamesToPhotoSet < ActiveRecord::Migration
  def change
    add_column :photo_sets, :photo1_filename, :string
    add_column :photo_sets, :photo2_filename, :string
    add_column :photo_sets, :photo3_filename, :string
    add_column :photo_sets, :photo4_filename, :string
  end
end
