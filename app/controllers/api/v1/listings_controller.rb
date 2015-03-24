class Api::V1::ListingsController < ApplicationController
  respond_to :json

  before_action :authorize_api_key
  before_action :load_listing, only: [:show, :update, :destroy]

  def index
    load_listings
    render json: @listings
  end

  def create
    build_listing
    save_listing or respond_with @listing
  end

  def update
    load_listing
    build_listing
    save_listing or respond_with @listing
  end

  def destroy
    load_listing
    @listing.destroy
    render json: { message: 'Listing deleted.' }, status: 200
  end

  def show
    load_listing
    render json: @listing
  end

  private
  def load_listing
    @listing ||= listings_scope.find(params[:id])
  end

  def load_listings
    @listings ||= listings_scope
  end

  def build_listing
    @listing ||= listings_scope.build
    @listing.attributes = listing_params
  end

  def save_listing
    if @listing.save
      render json: @listing
    end
  end

  def listing_params
    listing_params = params
    listing_params ? listing_params.permit(:name,
                                           :subcategory_id,
                                           :description,
                                           :price,
                                           :contact_name,
                                           :email,
                                           :telephone,
                                           :location_id,
                                           :user_id) : {}
  end

  def listings_scope
    Listing.all
  end
end
