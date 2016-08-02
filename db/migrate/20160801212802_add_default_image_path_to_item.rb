class AddDefaultImagePathToItem < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :image_path, :string, :default => 'http://i.imgur.com/5p6sEsX.jpg'
  end
end
