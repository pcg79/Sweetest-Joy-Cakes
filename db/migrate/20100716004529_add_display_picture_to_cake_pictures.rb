class AddDisplayPictureToCakePictures < ActiveRecord::Migration
  def self.up
    add_column :cake_pictures, :display_picture, :boolean
  end

  def self.down
    remove_column :cake_pictures, :display_picture
  end
end
