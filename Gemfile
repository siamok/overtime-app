# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'
gem 'rails', '~> 6.1'
gem 'sprockets-rails'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
# gem 'turbo-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false
# Use Sass to process CSS
gem 'sassc-rails'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'byebug'
  gem 'database_cleaner-active_record'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'robocop'
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'administrate', '~> 0.18.0'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bourbon'
gem 'cssbundling-rails'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'gritter', '1.2.0'
gem 'jquery-rails'
gem 'pundit', '~> 1.1'
gem 'twilio-ruby', '~> 4.11', '>= 4.11.1'
gem 'kaminari', '~> 1.2.2'