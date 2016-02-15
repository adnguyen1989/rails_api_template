# require 'mailgun'
# require 'mandrill'

class UserMailer < ApplicationMailer
  default from: ENV['SIGNUP_CONFIRMATION_EMAIL']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    # TODO: I18n

    # action mailer / mailgun_rails
    result = mail(to: @user.email, subject: "Sign Up Confirmation")
    # pp result


    # mailgun-ruby
    #   mg_client = Mailgun::Client.new('key-926c7f5f005715aeb4de87c4d8f8cd84')
    #   message_params = {:from    => ENV['SIGNUP_CONFIRMATION_EMAIL'],
    #                     :to      => @user.email,
    #                     :subject => 'Sample Mail using Mailgun API',
    #                     :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    #   mg_client.send_message('https://api.mailgun.net/v3/sandboxb2fe6edf1ce84c44977df8c409357b41.mailgun.org', message_params)


    # mandrill-api
    # mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY'])

    # body = mandrill.templates.render("Confirmation Email", [], ["FIRST_NAME": user.first_name,
    #   "CONFIRMATION_LINK": "localhost:3000/confirmation?#{@user.confirmation_token}" ])

    # result = mail(to: @user.email, subject: "Sign Up Confirmation", body: body)
  end
end
