## README

Install Rails 5
===
1. Install rails 5 under ruby 2.3.0: gem install rails --pre
2. Create new project rails new myapp --api --database=postgresql

Bundle
===
1. Run bundle update

Install figaro
===
1. Run figaro install
2. Edit environment variables in config/application.yml

Rollbar
===
1. Sign up for an account on rollbar.com and get the access token
2. Run rails generate rollbar
3. Add ROLLBAR_ACCESS_TOKEN: XXX to config/application.yml
4. Add require "Rollbar" to application.rb to load rollbar before everything else (might be Rails 5 issue)
5. Run rake rollbar:test, you should see some dummy errors on Rollbar Dashboard

Mailcatcher
===
1. Run gem install mailcatcher (http://mailcatcher.me/) to set up mailcatcher. (some issue with ruby 2.2.3 and rubygems 2.5.1 version. use 2.3.0)
2. Run mailcatcher in console: http://localhost:1080/
3. Add this to development.rb to set up mailcatcher in development

`
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
`

Guard and Growl
===
1. Run guard init to start automatic test suite run.
2. Download and install growlnotify to see guard test results as desktop notifications

Erd
===
1. gem install ruby-graphviz to support erd gem
2. run rake erd or rails erd to generate an entity relations diagram

PG
===
1. Make sure to add --database=postgresql to rails new command
2. Run rake db:create
3. Install http://postgresapp.com/ to get PG up and running

Puma
===
1. Edit puma.rb
2. Create a Procfile to specify Puma to be used as webserver (instead of default Webrick)

Cors
===
1. Config file is set in config/cors.rb
2. Edit the `origins` field to specify the frontend's domain to allow for cross-domain sharing


Deployment Heroku
===
1. Download heroku toolbelt: https://toolbelt.heroku.com/
2. Run heroku create <name>
3. Do heroku login
4. Do git push heroku master to deploy

Devise
===
1. Install devise from master github
2. Run rails generate devise:install
3. Run rails generate devise User
4. Uncomment confirmable in model
5. Uncomment confirmable in migration file
6. Rake db:migrate
7. Add email setting to environment(s)

Rspec
===
1. Install from master github
2.

Post-deployment
===
1. Heroku run rake db:migrate
2. Install Rollbar on Heroku
3. Do heroku config:add ROLLBAR_ACCESS_TOKEN=XXX to add rollbar access token to heroku
4. Do heroku run rake rollbar:test to test heroku's rollbar installation. You should see data on dashboard associated with heroku app

