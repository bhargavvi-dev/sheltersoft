source 'https://rubygems.org'

ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

group :development, :test do
  gem 'better_errors', '~> 2.1.1'
end

gem 'pg', '0.17.1'

#pagination
gem "will_paginate", '~> 3.0.7'

gem 'kaminari', '~> 0.16.3'

# Haml
gem "haml", '~> 4.0.6'

# Haml scaffolding functions
gem 'haml-rails', '~> 0.9.0', :group => :development

gem "devise", '~> 3.5.1'

gem "font-awesome-rails", '~> 4.3.0.0'

gem "activeadmin", github: "activeadmin"

gem "sidekiq", '~> 3.4.1'

gem 'exception_notification', '~> 4.1.1'

gem 'puma', '~> 2.11.3'

gem 'mail', '~> 2.6.3'

#bundle exec figaro heroku:set --app test-staging -e production
gem "figaro"

gem 'newrelic_rpm'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'activeadmin-ckeditor'

gem 'bootstrap-datetimepicker-rails'

gem "webget_ruby_secure_random"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'active_skin'

gem 'paperclip'

gem "paperclip-dropbox", ">= 1.1.7"

gem 'bootstrap_form'

gem 'meta-tags'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'sqlite3'
end

