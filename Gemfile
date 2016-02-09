source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta2', '< 5.1'

# Use PG as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma'

# https://github.com/laserlemon/figaro
# set environment variables in config/application.yml
gem 'figaro'

# https://github.com/redis/redis-rb
gem 'redis', '~> 3.0'

# https://github.com/rails-api/active_model_serializers
gem 'active_model_serializers', '~> 0.10.0.rc4'

# https://github.com/plataformatec/devise
gem 'devise', '~> 3.5', '>= 3.5.6'

# https://github.com/amatsuda/kaminari
gem 'kaminari', '~> 0.16.3'

# https://github.com/cyu/rack-cors
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  # http://github.com/deivid-rodriguez/byebug
  gem 'byebug'

  # http://github.com/rspec/rspec-rails
  # gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
end

group :development, :test, :staging do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.6', '>= 1.6.3'

  # https://github.com/jonleighton/spring-commands-rspec
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'

  # guard and growl for desktop alerts when tests complete
  # run guard init
  # install growlnotify and run it
  gem 'guard-rspec'
  gem 'growl'

  # draw erd diagram. run erd
  gem "rails-erd"

  # generate API docs from your test suite
  gem "rspec_api_documentation"

  # set up fake models and data for testing
  gem "factory_girl_rails"
  gem 'ffaker'
  gem "shoulda-matchers"

  # code coverage
  gem 'simplecov', :require => false

  # database cleaner to set clean slate for testing
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
end

group :staging, :production do

  # exception tracking tool
  gem 'rollbar', '~> 2.7', '>= 2.7.1'
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
