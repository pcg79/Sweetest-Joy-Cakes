# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'default'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  Categories = {
                 :birthdays => 'birthdays',
                 :weddings  => 'weddings',
                 :others    => 'other',
                 :practice  => 'practice'
               }

  ImageFileTypes = %W(jpeg jpg JPEG JPG).join(',')

  def image_list(category)
    return nil unless Categories.include?(category)
    Dir.chdir("#{RAILS_ROOT}/public/images")
    Dir["./thumbs/#{Categories[category]}/**/*.{#{ImageFileTypes}}"]
  end

  def category_image(category)
    return nil unless Categories.include?(category)
    Dir.chdir("#{RAILS_ROOT}/public/images")
    file = "./thumbs/#{Categories[category]}/category_image.jpg"
    file if FileTest.exist? file
  end
end