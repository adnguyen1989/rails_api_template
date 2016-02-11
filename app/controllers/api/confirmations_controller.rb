include ActionController::ImplicitRender

class Api::ConfirmationsController < Devise::ConfirmationsController
  before_action :not_allowed, only: [:new]

end
