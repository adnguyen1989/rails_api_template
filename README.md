## README

Install Rails 5
1. Install rails 5 under ruby 2.3.0: gem install rails --pre
2. Create new project rails new myapp --api --database=postgresql

Bundle
1. Run bundle update

Install figaro
1. Run figaro install
2. Edit environment variables in config/application.yml

Rollbar
1. Sign up for an account on rollbar.com and get the access token
2. Run rails generate rollbar
3. Add ROLLBAR_ACCESS_TOKEN: key to config/application.yml
4. Add require "Rollbar" to application.rb to load rollbar before everything else (might be Rails 5 issue)
5. Run rake rollbar:test, you should see some dummy errors on Rollbar Dashboard

Mailcatcher
1. Run gem install mailcatcher (http://mailcatcher.me/) to set up mailcatcher. (some issue with ruby 2.2.3 and rubygems 2.5.1 version. use 2.3.0)
2. Run mailcatcher in console: http://localhost:1080/
3. Add this to development.rb to set up mailcatcher in development

`
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
`

Guard and Growl
1. Run guard init to start automatic test suite run.
2. Download and install growlnotify to see guard test results as desktop notifications

Erd
1. gem install ruby-graphviz to support erd gem
2. run rake erd or rails erd to generate an entity relations diagram

PG
1. Make sure to add --database=postgresql to rails new command
2. Run rake db:create
3. Install http://postgresapp.com/ to get PG up and running

Deployment Heroku
1. Download heroku toolbelt: https://toolbelt.heroku.com/
2. Run heroku create <name>
3. Do heroku login
4. Do git push heroku master to deploy

Post-deployment
1. Install Rollbar on Heroku
2. Do heroku config:add ROLLBAR_ACCESS_TOKEN=01a1685606eb4944b391819776ff6fc4 to add rollbar access token to heroku
