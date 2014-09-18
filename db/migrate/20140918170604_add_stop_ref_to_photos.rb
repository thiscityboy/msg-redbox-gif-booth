class AddStopRefToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :stop, index: true
  end
end
