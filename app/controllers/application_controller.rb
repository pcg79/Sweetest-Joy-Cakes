# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery
  layout 'application'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  Categories = {
                 :birthdays => 'birthdays',
                 :weddings  => 'weddings',
                 :others    => 'other',
                 :practice  => 'practice'
               }

  ImageFileTypes = %W(jpeg jpg JPEG JPG).join(',')

  def category_image(category)
    orig_dir = Dir.pwd
    return nil unless Categories.include?(category)
    Dir.chdir("#{Rails.root}/public/images")
    file = "./thumbs/#{Categories[category]}/category_image.jpg"
    file = nil unless FileTest.exist? file
    Dir.chdir(orig_dir)
    file
  end
end