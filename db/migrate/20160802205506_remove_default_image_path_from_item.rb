class RemoveDefaultImagePathFromItem < ActiveRecord::Migration[5.0]
  def change
    change_column_default :items, :image_path, nil
  end
end
