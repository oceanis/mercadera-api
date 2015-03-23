class Api::V1::SubcategoriesController < ApplicationController
  respond_to :json

  before_action :authorize_api_key
  before_action :load_subcategory, only: [:show, :update, :destroy]

  def index
    load_subcategories
    render json: @subcategories
  end

  def create
    build_subcategory
    save_subcategory or respond_with @subcategory
  end

  def update
    load_subcategory
    build_subcategory
    save_subcategory or respond_with @subcategory
  end

  def destroy
    load_subcategory
    @subcategory.destroy
    render json: { message: 'Subcategory deleted.' }, status: 200
  end

  def show
    load_subcategory
    render json: @subcategory
  end

  private
  def load_subcategory
    @subcategory ||= subcategories_scope.find(params[:id])
  end

  def load_subcategories
    @subcategories ||= subcategories_scope
  end

  def build_subcategory
    @subcategory ||= subcategories_scope.build
    @subcategory.attributes = subcategory_params
  end

  def save_subcategory
    if @subcategory.save
      render json: @subcategory
    end
  end

  def subcategory_params
    subcategory_params = params
    subcategory_params ? subcategory_params.permit(:name, :category_id) : {}
  end

  def subcategories_scope
    Subcategory.all
  end
end
