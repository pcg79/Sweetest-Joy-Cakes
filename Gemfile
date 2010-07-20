source 'http://rubygems.org'

gem 'rails', '3.0.0.beta4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# Webserver
gem 'thin'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
# group :test do
#   gem 'webrat'
# end
gem "pg"
gem "haml", ">=3.0.4"
gem "compass", ">= 0.10.1"
# gem "formtastic-rails3"

group :test do
  gem "factory_girl", :git => "git://github.com/thoughtbot/factory_girl.git", :branch => "rails3"
  gem "shoulda",      :git => "git://github.com/thoughtbot/shoulda.git",      :branch => "rails3", :require => nil
end

# gem "rails3-generators", :git => "git://github.com/indirect/rails3-generators.git"
gem "paperclip", "=2.3.3", :git => "git://github.com/thoughtbot/paperclip.git"

gem "autotest"
gem "autotest-rails"
# gem "redgreen"
gem "autotest-growl"
gem "autotest-fsevent"

group :console do
  gem 'wirble'
  gem 'hirb'
end