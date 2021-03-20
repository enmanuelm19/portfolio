source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem "actionview", ">= 6.0.3.3"
gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bulma-rails', '~> 0.9.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'friendly_id'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'newrelic_rpm'
gem 'pg', '~> 0.20'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'rails', '~> 6.0.3'
gem 'ransack'
gem 'redcarpet'
gem 'rouge'
gem 'sass-rails', '~> 6.0.0'
gem 'slim-rails'
gem 'simplemde-rails'
gem 'sitemap_generator'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'bullet'
  gem 'capistrano',         require: false
  gem 'capistrano-db-tasks', require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'webdrivers'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
