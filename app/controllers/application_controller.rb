class ApplicationController < ActionController::API
  # clear_respond_to
  respond_to :json
  respond_to :html, only: []
  respond_to :xml, only: []


  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render text: '', content_type: 'text/plain'
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end


  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def doorkeeper_authorize_api
    doorkeeper_authorize! :api
    # doorkeeper_authorize!
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ::AbstractController::ActionNotFound, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  def render_404(exception)
    render json: { status: "404", error: exception.message }, status: 404
  end

  def render_500(exception)
    render json: { status: "500", error: exception.message }, status: 500
  end

  def not_allowed
    render json: { error: 'Method Not Allowed' }, status: 405
  end

end
