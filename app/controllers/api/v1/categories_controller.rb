class Api::V1::CategoriesController < ApplicationController
  respond_to :json

  before_action :authorize_api_key
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    load_categories
    render json: @categories
  end

  def create
    build_category
    save_category or respond_with @category
  end

  def update
    load_category
    build_category
    save_category or respond_with @category
  end

  def destroy
    load_category
    @category.destroy
    render json: { message: 'Category deleted.' }, status: 200
  end

  def show
    load_category
    render json: @category
  end

  private
  def load_category
    @category ||= categories_scope.find(params[:id])
  end

  def load_categories
    @categories ||= categories_scope
  end

  def build_category
    @category ||= categories_scope.build
    @category.attributes = category_params
  end

  def save_category
    if @category.save
      render json: @category
    end
  end

  def category_params
    category_params = params
    category_params ? category_params.permit(:name) : {}
  end

  def categories_scope
    Category.all
  end
end
