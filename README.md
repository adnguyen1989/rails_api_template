## README

1. Install rails 5
2. Create new project rails new myapp --api --database=postgresql
3. Run bundle update
4. Run figaro install, and edit stuff in config/application.yml
5. Sign up for an account on rollbar
6. Add ROLLBAR_ACCESS_TOKEN: key to config/application.yml
7. Add require "Rollbar" to application.rb to load rollbar
8. Run rake rollbar:test, you should see some dummy errors on Rollbar Dashboard
9. Run gem install mailcatcher (http://mailcatcher.me/) to set up mailcatcher. (some issue with ruby and rubygems version. Avoid 2.2.3)
10. Run mailcatcher in console: http://localhost:1080/
11. Add this to development.rb to set up mailcatcher in development
`
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
`
12. Run guard init to start automatic test suite run.
13. Download and install growlnotify to see guard test results as desktop notifications
14. gem install ruby-graphviz to support erd gem
15. Run rake db:create and Install http://postgresapp.com/ to get PG up and running
