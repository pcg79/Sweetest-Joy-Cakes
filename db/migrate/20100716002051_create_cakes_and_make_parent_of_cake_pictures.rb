class CreateCakesAndMakeParentOfCakePictures < ActiveRecord::Migration
  def self.up
    create_table :cakes do |t|
      t.string :name

      t.timestamps
    end

    add_column :cake_pictures, :cake_id, :integer
  end

  def self.down
    remove_column :cake_pictures, :cake_id
    drop_table :cakes
  end
end
