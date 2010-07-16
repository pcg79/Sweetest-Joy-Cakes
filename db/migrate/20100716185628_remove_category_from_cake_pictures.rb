class RemoveCategoryFromCakePictures < ActiveRecord::Migration
  def self.up
   remove_column :cake_pictures, :category
  end

  def self.down
    add_column :cake_pictures, :category, :string
  end
end
