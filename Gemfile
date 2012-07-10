source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'bootstrap-sass', '2.0.0'
gem 'devise'
gem "paperclip", "~> 3.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml'
  # gem 'therubyracer', :platform => :ruby
  gem 'jquery-ui-rails'	
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml-rails'


group :test, :development do
  gem 'rspec-rails'
  gem 'watchr'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'heroku'
  gem 'foreman'
  gem 'mysql2'
end

group :production do
  gem 'pg'
  gem 'thin'
end

group :test do
  gem 'spork'
end
