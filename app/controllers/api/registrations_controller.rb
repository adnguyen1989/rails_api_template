include ActionController::ImplicitRender

class Api::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  before_filter :not_allowed, only: [:new, :edit, :cancel]
  before_filter :doorkeeper_authorize_api, only: [:update, :destroy]
  before_filter :get_resource!, only: [:update, :destroy]

  skip_before_filter :authenticate_scope!

  private

  def current_user
    @current_user ||= current_resource_owner
  end

  def sign_up_params
    params.require(:user).permit!
    # params.require(:user).permit([
    #   :email,
    #   :password,
    #   :password_confirmation,
    #   :first_name,
    #   :last_name
    # ])
  end

  def account_update_params
    # params.require(:user).permit!
    params.require(:user).permit([
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
      :ui_language,
      :original_language,
      :target_language,
      :current_password
    ])
  end

  def get_resource!()
    self.resource = current_resource_owner
  end

  protected

  def update_resource(resource, params)
    if params[:password] || params[:email]
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end
end
