source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'bcrypt'
gem 'bootstrap', '~> 4.3.1'
gem 'dotenv-rails'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'pre-commit'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'rubocop'
gem 'rubocop-rails', require: false
gem 'sass-rails', '>= 6'
gem 'simple_calendar', '~> 2.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rspec-request_describer'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
