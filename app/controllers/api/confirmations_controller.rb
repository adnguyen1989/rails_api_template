include ActionController::ImplicitRender

class Api::ConfirmationsController < Devise::ConfirmationsController
  before_filter :not_allowed, only: [:new]

end
