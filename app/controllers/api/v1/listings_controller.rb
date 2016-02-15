class Api::V1::ListingsController < ApplicationController

  def index
    # UserMailer.signup_confirmation(@user).deliver_later

    @listings = Listing.all
    render json: @listings, status: 200
  end
end
