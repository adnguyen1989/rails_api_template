class StaticPagesController < ActionController::API
  def home
    render json: {}, status: 200
  end
end
