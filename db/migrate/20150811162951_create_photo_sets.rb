class CreatePhotoSets < ActiveRecord::Migration
  def change
    create_table :photo_sets do |t|
      t.string :mdn

      t.timestamps
    end
  end
end
