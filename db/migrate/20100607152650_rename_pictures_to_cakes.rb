class RenamePicturesToCakes < ActiveRecord::Migration
  def self.up
    rename_table :pictures, :cakes
  end

  def self.down
    rename_table :cakes, :pictures
  end
end
