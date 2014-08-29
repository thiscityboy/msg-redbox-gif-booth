class AddFramedContentToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :framed_base64, :text
    add_column :photos, :framed_filename, :string
    add_column :photos, :framed_type, :string
  end
end
