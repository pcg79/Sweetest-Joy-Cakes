# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# ["Birthdays", "Weddings", "Other Special Occasions"].each do |cat|
#   c = Category.create(:name => cat)
# end
#
# cakes = { "Birthdays" => ["Elmo (simple)", "Elmo", "Toy Story"],
#   "Other Special Occasions" => ["Rainbow", "Clown Cupcakes", "Flower Bouquet", "Flower Cascade", "First Communion", "Birthday Present", "Pink Flower Cascade"] }
#
# cakes.each_pair do |cat, cake_array|
#   category = Category.find_by_name(cat)
#
#   if category
#     cake_array.each do |cake|
#       c = Cake.create(:name => cake)
#       category.cakes << c
#     end
#   else
#     puts "**** Error!  Unable to find cateogry with the name #{cat}."
#   end
# end
#

begin
  ImageFileTypes = %W(jpeg jpg JPEG JPG).join(',')

  import_dir = "#{Rails.root}/to_import"

  count = 0
  total_size = 0

  Dir.chdir(import_dir)
  Dir["./**/*.{#{ImageFileTypes}}"].each do |f|
    split_result = f.split(File::SEPARATOR)
    category_name  = split_result[1]
    cake_name = split_result[2]
    file_name = split_result[-1]

    # puts "*** Checking #{f}"

    category = Category.find_or_create_by_name(category_name)
    cake = Cake.find_or_create_by_name_and_category_id(cake_name, category.id)
    # cp = CakePicture.find_or_create_by_photo_file_name_and_cake_id(file_name, cake.id, :display_picture => !!(file_name =~ /display/i)) do |pic|
    #   File.open(f) { |photo_file| pic.photo = photo_file }
    # end

    unless CakePicture.find_by_photo_file_name_and_cake_id(file_name, cake.id)
      puts "*** Adding #{f}"
      puts "* Category = #{category.inspect}"
      puts "* Cake = #{cake.inspect}"

      File.open(f, 'r') do |photo_file|
        cp = CakePicture.new
        cp.cake = cake
        cp.display_picture = !!(file_name =~ /display/i)
        cp.photo = photo_file
        cp.save!

        total_size += cp.photo_file_size
        puts "** CakePicture = #{cp.inspect}"
      end
      count += 1
      puts #blank line
      sleep(2)
    else
      # puts "Cake already exists"
    end
  end
rescue Exception => e
  puts e.message
  # puts e.backtrace.join "\n"
  puts "#{count} Pictures Saved"
  puts "#{total_size} Total file size"
end