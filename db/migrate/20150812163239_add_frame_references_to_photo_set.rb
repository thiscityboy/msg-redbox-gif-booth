class AddFrameReferencesToPhotoSet < ActiveRecord::Migration
  def change
    add_reference :photo_sets, :frame, index: true
  end
end
