source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 3.12'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Allow custom ENV configs
gem 'dotenv-rails', '~> 2.7'

# Auth system
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'devise-i18n', '~> 1.8'
gem 'devise-bootstrap-views', '~> 1.1'
gem 'cancancan', '~> 3.0'

# Form builder
gem 'simple_form', '~> 5.0'
gem 'enum_help'

# A bit of fun
gem 'identicon'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Test tools
  gem 'rspec-rails', '~> 4.0beta'
  gem 'shoulda-matchers', '~> 4.1'
  gem 'rails-controller-testing', '~> 1.0'
  gem 'factory_bot_rails', '~> 5.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
