# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.10"

gem "bootsnap", require: false
gem "brakeman"
gem "bundler-audit"
gem "image_processing", "~> 1.12"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.5"
gem "puma", ">= 6.4.3"
gem "rails", "~> 7.1.6"
gem "redis", "~> 5.0"
gem "rexml", ">= 3.3.9"
gem "rubocop-rails"
gem "sidekiq", "7.1.6"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem 'webrick'

# Monitoring
gem 'yabeda-prometheus'
gem 'yabeda-puma-plugin'
gem 'yabeda-rails'
gem 'yabeda-sidekiq'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "1.8.0", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "rack-mini-profiler"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
