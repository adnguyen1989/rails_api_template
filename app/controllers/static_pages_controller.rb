class StaticPagesController < ActionController::API
  def home
    render json: { rollbar: ENV["ROLLBAR_ACCESS_TOKEN"]}, status: 404
  end
end
