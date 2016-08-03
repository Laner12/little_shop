class AddUploadImageToItem < ActiveRecord::Migration[5.0]
  def change
    add_attachment :items, :upload_image
  end
end
