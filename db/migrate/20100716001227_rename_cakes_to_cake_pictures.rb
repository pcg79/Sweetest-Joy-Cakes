class RenameCakesToCakePictures < ActiveRecord::Migration
  def self.up
    rename_table :cakes, :cake_pictures
  end

  def self.down
    rename_table :cake_pictures, :cakes
  end
end
