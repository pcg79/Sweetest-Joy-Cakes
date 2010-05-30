class AddCategoryToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :category, :string
  end

  def self.down
    remove_column :pictures, :category
  end
end
