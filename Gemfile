source 'https://rubygems.org'
gem 'thin'
gem 'dalli'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
#
gem 'kaminari' 


gem 'simplecov', :require => false, :group => :test

group :test, :development do
  #RSPEC Gems
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem "capybara"
  gem 'shoulda-matchers'
 # gem 'better_errors'
 # gem 'binding_of_caller'

  gem 'factory_girl_rails'
  #MINITEST Gems
  # gem 'minitest-rails-capybara'
  #
  gem 'launchy'
  gem 'pry'
  gem 'guard'
  gem 'guard-minitest'
  gem 'sqlite3'
  gem 'pg'
  gem 'faker'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# group :development do
#   gem 'rails-erd'
# end

gem 'bootstrap-sass'
gem 'sorcery'
gem 'paperclip'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'aws-sdk', '~> 1.25'
