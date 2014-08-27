class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :family_name
      t.string :mdn
      t.text :content_base64
      t.string :content_type
      t.string :content_filename

      t.timestamps
    end
  end
end
