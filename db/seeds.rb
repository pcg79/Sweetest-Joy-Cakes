# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

["Birthdays", "Weddings", "Other Special Occasions"].each do |cat|
  c = Category.create(:name => cat)
end

cakes = { "Birthdays" => ["Elmo (simple)", "Elmo", "Toy Story"],
  "Other Special Occasions" => ["Rainbow", "Clown Cupcakes", "Flower Bouquet", "Flower Cascade", "First Communion", "Birthday Present", "Pink Flower Cascade"] }

cakes.each_pair do |cat, cake_array|
  category = Category.find_by_name(cat)

  if category
    cake_array.each do |cake|
      c = Cake.create(:name => cake)
      category.cakes << c
    end
  else
    puts "**** Error!  Unable to find cateogry with the name #{cat}."
  end
end