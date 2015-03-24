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

  def new_s3_upload
    direct_post_url = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}",
                                               success_action_status: 201,
                                               acl: :public_read)
    render json: { url: direct_post_url.url.to_s,
                   fields: direct_post_url.fields.to_json.gsub!(/\"/, '\'') }, status: 200
  end

  def picture
    load_listing
    build_listing_picture
    save_listing_picture or respond_with @listing_picture
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

  def build_listing_picture
    @listing_picture ||= listing_pictures_scope.build
    @listing_picture.attributes = listing_picture_params
  end

  def save_listing
    if @listing.save
      render json: @listing
    end
  end

  def save_listing_picture
    if @listing_picture.save
      render json: @listing_picture
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

  def listing_picture_params
    listing_picture_params = params
    listing_picture_params ? listing_picture_params.permit(:url) : {}
  end

  def listings_scope
    Listing.all
  end

  def listing_pictures_scope
    @listing.listing_pictures
  end
end
