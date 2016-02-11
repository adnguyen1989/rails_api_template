include ActionController::ImplicitRender

class Api::PasswordsController < Devise::PasswordsController
  before_action :not_allowed, only: [:new, :edit]
end
