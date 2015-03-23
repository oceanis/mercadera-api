class Api::V1::LocationsController < ApplicationController
  respond_to :json

  before_action :authorize_api_key
  before_action :set_location, only: [:show, :update, :destroy]

  def index
    load_locations
    render json: @locations
  end

  def create
    build_location
    save_location or respond_with @location
  end

  def update
    load_location
    build_location
    save_location or respond_with @location
  end

  def destroy
    load_location
    @location.destroy
    render json: { message: 'Location deleted.' }, status: 200
  end

  def show
    load_location
    render json: @location
  end

  private
  def load_location
    @location ||= locations_scope.find(params[:id])
  end

  def load_locations
    @locations ||= locations_scope
  end

  def build_location
    @location ||= locations_scope.build
    @location.attributes = location_params
  end

  def save_location
    if @location.save
      render json: @location
    end
  end

  def location_params
    location_params = params
    location_params ? location_params.permit(:name) : {}
  end

  def locations_scope
    Location.all
  end
end
