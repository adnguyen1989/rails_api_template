class Api::V1::ListingsController < ApplicationController
  before_action :set_api_v1_listing, only: [:show, :update, :destroy]

  # GET /api/v1/listings
  def index
    @api_v1_listings = Api::V1::Listing.all

    render json: @api_v1_listings
  end

  # GET /api/v1/listings/1
  def show
    render json: @api_v1_listing
  end

  # POST /api/v1/listings
  def create
    @api_v1_listing = Api::V1::Listing.new(api_v1_listing_params)

    if @api_v1_listing.save
      render json: @api_v1_listing, status: :created, location: @api_v1_listing
    else
      render json: @api_v1_listing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/listings/1
  def update
    if @api_v1_listing.update(api_v1_listing_params)
      render json: @api_v1_listing
    else
      render json: @api_v1_listing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/listings/1
  def destroy
    @api_v1_listing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_listing
      @api_v1_listing = Api::V1::Listing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_listing_params
      params.fetch(:api_v1_listing, {})
    end
end
