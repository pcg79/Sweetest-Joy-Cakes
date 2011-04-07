#!/usr/bin/env ruby

# Requires fixing paperclip to work w/ Rails 3:
# http://github.com/dwalters/paperclip/commit/2a85add5f102db8773518f8ac30f7e2337bf7d13

class PictureImporter
  ImageFileTypes = %W(jpeg jpg JPEG JPG).join(',')

  ENV_PATH  = File.expand_path('../../config/environment',  __FILE__)
  BOOT_PATH = File.expand_path('../../config/boot',  __FILE__)
  APP_PATH  = File.expand_path('../../config/application',  __FILE__)

  def self.init(args)
    require APP_PATH
    require BOOT_PATH
    require ENV_PATH

    @import_dir = "#{::Rails.root}/to_import"
  end

  def self.import
    Dir.chdir(@import_dir)
    Dir["./**/*.{#{ImageFileTypes}}"].each do |f|
      category_name = f.split(File::SEPARATOR)[1]
      cake_name = f.split(File::SEPARATOR)[2]
      file_name = f.split(File::SEPARATOR)[3]

      puts "*** Checking #{f}"

      category = ::Category.find_or_create_by_name(category_name)
      cake = category.cakes.find_or_create_by_name(cake_name)

      unless cake.cake_pictures.find_by_photo_file_name(file_name)
        puts "*** Importing #{f}"
        cp = cake.cake_pictures.create!(:photo => File.open(f))
        puts "*** Imported #{cp.inspect}"
      end

      # unless ::Cake.find_by_photo_file_name_and_category(file_name, category)
      #   puts "*** Importing #{f}"
      #   p = ::Cake.new
      #   p.photo = File.open(f)
      #   p.category = category
      #   p.save!
      # end
    end
  end
end

PictureImporter.init(ARGV)
PictureImporter.import