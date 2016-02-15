## README

Install Rails 5
===
1. Install rails 5 under ruby 2.3.0: gem install rails --pre
2. Create new project rails new myapp --api --database=postgresql

Bundle *
===
1. Run bundle update

Install figaro *
===
1. Run figaro install
2. Edit environment variables in config/application.yml

Rollbar *
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

Rspec
===
1. Install and use edge versions

Environment setup *
===
1. add RAILS_ENV=production to tasks like rake db or puma to specify the environment
2. For production, need to create a user when running production locally
  a. CREATE USER myapp WITH PASSWORD 'thepassword';
  b. CREATE DATABASE myapp_development OWNER myapp;
  c. \q + Enter

Reference

1. http://stackoverflow.com/questions/22647993/pgconnectionbad-fatal-role-myapp-does-not-exist
2. http://stackoverflow.com/questions/4909831/rake-dbmigrate-doesnt-seem-to-work-in-production

Performance testing
===
1. Run in production RAILS_ENV=production rails s (see environment setup if error with role not found)

```
Server Software:
Server Hostname:        127.0.0.1
Server Port:            3000

Document Path:          /listings
Document Length:        450 bytes

Concurrency Level:      5
Time taken for tests:   57.655 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      7940000 bytes
HTML transferred:       4500000 bytes
Requests per second:    173.45 [#/sec] (mean)
Time per request:       28.827 [ms] (mean)
Time per request:       5.765 [ms] (mean, across all concurrent requests)
Transfer rate:          134.49 [Kbytes/sec] received
```

2.

Reference

1. http://www.ostinelli.net/how-to-build-a-rails-api-server-optimizing-the-framework/
2. https://robots.thoughtbot.com/how-to-evaluate-your-rails-json-api-for-performance-improvements
3. https://www.nateberkopec.com/2015/07/22/secrets-to-speedy-ruby-apps-on-heroku.html

Pow/Powder *
===

1. Install pow
2. Gem install powder for easy management of pow (powder link, up, down)

Devise
===
1. Install devise from master github
2. Run rails generate devise:install
3. Run rails generate devise User
4. Uncomment confirmable in model
5. Uncomment confirmable in migration file
6. Rake db:migrate
7. Add email setting to environment(s)

Deployment Heroku
===
1. Download heroku toolbelt: https://toolbelt.heroku.com/
2. Run heroku create <name>
3. Do heroku login
4. Do git push heroku master to deploy

Post-deployment
===
1. Heroku run rake db:migrate
2. Install Rollbar on Heroku
3. Do heroku config:add ROLLBAR_ACCESS_TOKEN=XXX to add rollbar access token to heroku
4. Do heroku run rake rollbar:test to test heroku's rollbar installation. You should see data on dashboard associated with heroku app
5. Do heroku run rake db:seed to seed heroku

Mailer
===
1. rails g mailer UserMailer signup_confirmation
2. it will generate the following file
  1. create  app/mailers/user_mailer.rb: user mailer
  2. create    spec/mailers/user_mailer_spec.rb: user mailer RSpec test
  3. create    spec/fixtures/user_mailer/signup_confirmation: don't care about this
  4. create    spec/mailers/previews/user_mailer_preview.rb: a file to preview the mail on browser
  5. application mailer: home mailer
  6. plus need to add views/user_mailer/signup_confirmation.html.erb + .text.erb
3. in UserMailer
  1. set the default front
  2. use the command mail(to: "xx", subject: "xx", body: "xx")
  3. need to require mailgun or mandrill if using one of those
4. in user controller
  1. UserMailer.signup_confirmation(@user).deliver_later
  2. deliver_later activates Active Job to send the email synchronously
5. mailgun
  1. install mailgun_rails
  2. and add this production.rb:
  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
        api_key: ENV['MAILGUN_API_KEY'],
        domain: ENV['MAILGUN_DOMAIN'] #this should only be the domain, not the whole URL
  }
  3. syntax same as action mailer
6. mandrill
  1. install mandrill-api
  2. add this to production.rb
  # config.action_mailer.default_url_options = { host: ENV["MANDRILL_DOMAIN"] }
  # config.action_mailer.smtp_settings = {
  #   :address   => "smtp.mandrillapp.com",
  #   :port      => 25,
  #   :enable_starttls_auto => true,
  #   :user_name => ENV["MANDRILL_USERNAME"],
  #   :password  => ENV["MANDRILL_API_KEY"],
  #   :authentication => 'login',
  #   :domain => ENV["MANDRILL_DOMAIN"]
  # }
  3. need a verified domain
  4. need to create a test api key
  5. use this syntax following the article: https://robots.thoughtbot.com/how-to-send-transactional-emails-from-rails-with-mandrill
    # mandrill-api
    # mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY'])

    # body = mandrill.templates.render("Confirmation Email", [], ["FIRST_NAME": user.first_name,
    #   "CONFIRMATION_LINK": "localhost:3000/confirmation?#{@user.confirmation_token}" ])

    # result = mail(to: @user.email, subject: "Sign Up Confirmation", body: body)

