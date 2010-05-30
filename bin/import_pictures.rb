#!/usr/bin/env ruby

class PictureImporter
  ImageFileTypes = %W(jpeg jpg JPEG JPG).join(',')

  def self.init(args)
    # Rails init
    ENV['RAILS_ENV'] = ENV['RAILS_ENV'] || "development"

    puts "Using #{ENV['RAILS_ENV']} environment."

    require File.dirname(__FILE__) + '/../config/boot'
    require "#{RAILS_ROOT}/config/environment"

    # Open ActiveRecord connection
    self.connect(ARGV.first)

    @import_dir = "#{RAILS_ROOT}/to_import"
  end

  def self.import
    Dir.chdir(@import_dir)
    Dir["./**/*.{#{ImageFileTypes}}"].each do |f|
      category  = f.split(File::SEPARATOR)[1].downcase
      file_name = f.split(File::SEPARATOR)[-1]

      puts "*** Checking #{f}"
      unless Picture.find_by_photo_file_name_and_category(file_name, category)
        puts "*** Importing #{f}"
        p = Picture.new
        p.photo = File.open(f)
        p.category = category
        p.save!
      end
    end
  end

  private

  class << self
    def connect(environment)
      conf = YAML::load(File.open(File.dirname(__FILE__) + '/../config/database.yml'))
      ActiveRecord::Base.establish_connection(conf[environment])
    end
  end
end

PictureImporter.init(ARGV)
PictureImporter.import