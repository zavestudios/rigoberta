# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "bootsnap", require: false
gem "brakeman"
gem "bundler-audit"
gem "image_processing", "~> 1.12"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.5"
gem "puma", "~> 6.3"
gem "redis", "~> 5.0"
gem "sidekiq", "7.1.6"
gem "stimulus-rails"
gem "rails", "~> 7.0.6"
gem "rubocop-rails"
gem "sprockets-rails"
gem "turbo-rails"
gem 'webrick'

# Monitoring 
gem 'yabeda-rails'
gem 'yabeda-puma-plugin'
gem 'yabeda-sidekiq'
gem 'yabeda-prometheus'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "1.8.0", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
