include ActionController::ImplicitRender

class Api::PasswordsController < Devise::PasswordsController
  before_filter :not_allowed, only: [:new, :edit]
end
