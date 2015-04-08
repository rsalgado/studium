source 'https://rubygems.org'
ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'  
end

# Use PostgreSQL as the production database
group :production do
  gem 'pg', '~> 0.15'
  gem 'rails_12factor', '0.0.2'
  gem 'thin'
end

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


# Additional gems for this project

## Use Devise for authentication
gem 'devise', '~> 3.0'

## Use Bootstrap SASS
gem 'bootstrap-sass', '~> 3.0.3.0'

## Enable the use of Slim in the project
gem 'slim'

## TDD gems (Rspec and FactoryGirl)
group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
end

# Summernote gems (it also relies on bootstrap-sass)
gem 'font-awesome-sass', '~> 4.0.2'
gem 'summernote-rails', '~> 0.4.0'

# PJAX dependency
gem 'pjax_rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
